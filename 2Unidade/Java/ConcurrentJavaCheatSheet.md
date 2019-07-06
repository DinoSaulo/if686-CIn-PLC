#Original Source:
https://gist.github.com/rafaelmotaalves/27a65a60fea7cea22216cc69360e0b06

## Criando um Thread:

```java
  class MyThread extends Thread {
    public void run () {
    }
    
	  public static void main(String[] args) {
      new MyThread().start()
    }
  }
```
ou

```java
  class MyThread implements Runnable {
    public void run () {
    }
    
	  public static void main(String[] args) {
      new Thread(new MyThread()).start()
    }
  }
```

## Utilizando threads surge a necessidade criar código que suporte concorrência para acesso de uma mesmo recurso.
#### Para isso podemos usar locks, podendo ser:
* Locks implicitos:
```java
public class BankAccount {

  private Double balance;
	
  // usando o lock implicito do objeto, equivalente a usar synchronized(this)
  public synchronized void credit (double value) {
		this.balance = this.balance + value;
	}
  
  // usando o lock implicito do atributo
  public void debit (double value) {
    synchronized (this.balance) {
          this.balance = this.balance - value;
    }
  }
}
```
* Locks explicitos:
```java
import java.util.concurrent.locks.Lock; // Interface lock
import java.util.concurrent.locks.ReentrantLock; // Uma das implementações de lock

public class BankAccount {

	private Double balance;
	private Lock lock;

	BankAccount () {
    // Lock é instânciado pelo programador
		this.lock = new ReentrantLock();
	}
  
  // E é explicitamente lockado e deslockado
	public synchronized void credit (double value) {
		this.lock.lock();
		try {
			this.balance = this.balance + value;	  		
		} finally {
			this.lock.unlock();
		}
	}

	public void debit (double value) {
		this.lock.lock();
		try {
			this.balance = this.balance - value;
		} finally {
			this.lock.unlock();
		}	
	}
}
}
```
### Usando locks pode ter alguma situação que a gente quer que um thread espere outra, seja pra satisfazer um condição ou disponibilizar um recurso para isso podemos utilizar o notify() e wait()
#### Um exemplo clássico de uso do notify/wait é um Semáforo, que é um contador que segue as seguintes regras:
* up - incrementa o contador do semáforo e acorda threads que estejam bloqueadas
* down - decrementa o contador do semáforo ou, caso seja zero, bloqueia a thread

```java
public class Semaphore {
	private int counter;

	public synchronized void up () {
		counter++; // Incrementa o contador
		notify(); // Avisa uma thread (escolhida aleatóriamente) para parar de "waitar"
		// Uma alternativa é usar o notifyAll() que avisaria todas as threads
	}

	public synchronized void down () throws InterruptedException {
		if (counter <= 0) { // Caso o contador seja igual ou menor que 0
			wait(); // Bloqueia a thread
			down(); // Após a thread ser "reacordada", executa novamente o a função pra checar a condição novamente
			// Acho que nesse caso eu poderia decrementar diretamente porque eu to usando o notify()
			// mas só pra garantir deixa assim
		} else {
			// Caso o contador seja maior que zero apenas decrementa o contador
			counter--;
		}
	}
}
```
- OBS: notify() wait() notifyAll() só podem ser utilizados dentro de blocos sincronizados, da pra fazer essa mesma coisa com locks explictitos com a interface Condition, mas não vou botar aqui

### Abstrações da java.util.concurrent
#### Tipos primitivos Atomic
Os tipos primitivos Atomic são basicamente os tipos primitivos do java, mas por baixo de um classe, que faz todo o tratamento de acesso concorrente ao tipo primitivo, exemplo de uso:

```java
import java.util.concurrent.atomic.AtomicInteger;

public class BankAccount {
	
	private AtomicInteger balance = new AtomicInteger(0);
	
	public void credit (int value) {
		this.balance.set(this.balance.get() + value);
	}
	
	public void debit (int value) {
		this.balance.set(this.balance.get() - value);	
	}
}
``` 
- Existem outros tipos primitivos atômicos como: AtomicBoolean, AtomicInteger, AtomicLong e AtomicReference

### Interface BlockingQueue<E>
A interface BlockingQueue<E> define uma fila bloqueante, ou seja um fila que caso a Thread tente acessar um elemento da fila e ela estiver vázia, a thread vai ser bloqueada até que a fila fique não vazia, e ele possa pegar um elemento da fila. A mesma coisa se for uma fila de tamanho finito, quando a Thread tentar enfilerar um elemento e ela estiver cheia, a Thread esperará que a fila tenha um espaço livre. Os acessos bloqueantes são feitos a partir dos métodos put() e take(), exemplo de uso:
	
``` java
package produtorConsumidor;

import java.util.concurrent.BlockingQueue; // Interface BlockingQueue
import java.util.concurrent.LinkedBlockingQueue; // Implementação com LinkedList

public class ProdutorConsumidor {

	public static void main(String[] args) {

		BlockingQueue<Integer> buffer = new LinkedBlockingQueue<Integer>();

		new Thread(new Produtor(buffer)).start();
		new Thread(new Consumidor(buffer)).start();
	}

}

class Consumidor implements Runnable {

	private BlockingQueue<Integer> queue;

	Consumidor (BlockingQueue<Integer> queue) {
		this.queue = queue;
	}

	@Override
	public void run() {
		try {
			while (true) {
				System.out.println("TRY_TAKE");
				int i = queue.take();
				System.out.println("GET " + i);
				Thread.sleep(500);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}


class Produtor implements Runnable {

	private BlockingQueue<Integer> queue;

	Produtor (BlockingQueue<Integer> queue) {
		this.queue = queue;
	}

	@Override
	public void run() {
		try {
			int i = 0;
			while (true) {
				System.out.println("TRY_PUT " + i);
				queue.put(i);
				System.out.println("PUT " + i);
				i++;
				Thread.sleep(2000);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}


}

```