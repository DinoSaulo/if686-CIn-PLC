# RESUMO DE THREADS COM JAVA

#### Clico de vida de uma thread

![Clico de vida de uma thread](/Ciclo_de_vida_de_uma_Thread.png)

#### Implementação

Há duas maneiras de implementar Threads no Java

* Estendendo a classe Thread
* Implementando a interface Runnable

#### Classe Thread

Para a implementação é essencial que a classe estenda de Thread, isso é feito através de `extends Thread`

##### Métodos básicos da classe Thread
* `.start()` => Irá iniciar a Thread
* `run()` => Conterá o código que será executado quando a thread for iniciada, caso não seja implementado a thread não faz nada
* `sleep(x)` => Bota a thread para "dormir" por x milissegundos. *Esse método requisita estar dentro de um try-catch pois poderá dar uns erros malucos

Feito isso basta criar a implementação da Thread

Há dois pontos essenciais que não podem ser esquecidos
1. Iniciar a thread através do `.start()`, se tu não fez isso teu programa vai fazer nada boy
2. Implementar a sua classe `run()`

##### Exemplo 1 - Basicão

```
public class MinhaThread extends Thread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MinhaThread thread = new MinhaThread("Thread #1");
		thread.start();
	}

	private String nome;

	public MinhaThread(String nome) {
		this.nome = nome;
	}

	public void run() {
		System.out.println("Executando a thread :" + nome);

	}

}

```

##### Exemplo 2 - Threads contando e dormindo
```
public class MinhaThread extends Thread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MinhaThread thread = new MinhaThread("Thread #1", 600);
		MinhaThread thread2 = new MinhaThread("Thread #2", 900);
		MinhaThread thread3 = new MinhaThread("Thread #3", 200);
	}

	private String nome;
	private int tempo;

	public MinhaThread(String nome, int tempo) {
		this.nome = nome;
		this.tempo = tempo;
		start();
	}

	public void run() {
		for(int i=0; i<6; i++) {
			System.out.println(nome + " contador " + i);
			try {
				Thread.sleep(tempo);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
```

#### Interface Runnable


