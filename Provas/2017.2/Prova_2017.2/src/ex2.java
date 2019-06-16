import java.util.concurrent.atomic.AtomicInteger;

// Material de referencia : https://technicalmumbojumbo.wordpress.com/2009/08/28/java-util-concurrent-atomic-atomicinteger/
public class ex2  {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final ContaBancaria2 contaCompartilhada = new ContaBancaria2();
		
		Pessoa1R pessoa1 = new Pessoa1R(contaCompartilhada);
		Pessoa2R pessoa2 = new Pessoa2R(contaCompartilhada);
		Pessoa3R pessoa3 = new Pessoa3R(contaCompartilhada);
		Pessoa4R pessoa4 = new Pessoa4R(contaCompartilhada);
		Pessoa5R pessoa5 = new Pessoa5R(contaCompartilhada);
		Pessoa6R pessoa6 = new Pessoa6R(contaCompartilhada);
		
		new Thread(pessoa1).start();
		new Thread(pessoa2).start();
		new Thread(pessoa3).start();
		new Thread(pessoa4).start();
		new Thread(pessoa5).start();
		new Thread(pessoa6).start();
		

	}
	
}	

// --------------------------- Inicio impelentacao das pessoas  --------------------------- 

class Pessoa1R implements Runnable {
	
	private ContaBancaria2 contaCompartilhada;

	public Pessoa1R(ContaBancaria2 contaCompartilhada) {
		this.contaCompartilhada = contaCompartilhada;
	}
	
	public void run() {
		// TODO Auto-generated method stub
		while (true) {
            try {
            	contaCompartilhada.depositar((int) (Math.random() * 100));
            	contaCompartilhada.sacar((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 100));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
	}
}

class Pessoa2R implements Runnable {
	
	private ContaBancaria2 contaCompartilhada;

	public Pessoa2R(ContaBancaria2 contaCompartilhada) {
		this.contaCompartilhada = contaCompartilhada;
	}
	
	public void run() {
		// TODO Auto-generated method stub
		while (true) {
            try {
            	contaCompartilhada.obterSaldo();
            	contaCompartilhada.sacar((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 200));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
	}
}

class Pessoa3R implements Runnable {
	
	private ContaBancaria2 contaCompartilhada;

	public Pessoa3R(ContaBancaria2 contaCompartilhada) {
		this.contaCompartilhada = contaCompartilhada;
	}
	
	public void run() {
		// TODO Auto-generated method stub
		while (true) {
            try {
            	contaCompartilhada.depositar((int) (Math.random() * 100));
            	contaCompartilhada.obterSaldo();        		
        		contaCompartilhada.depositar((int) (Math.random() * 100));
            	contaCompartilhada.sacar((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 300));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
	}
}

class Pessoa4R implements Runnable {
	
	private ContaBancaria2 contaCompartilhada;

	public Pessoa4R(ContaBancaria2 contaCompartilhada) {
		this.contaCompartilhada = contaCompartilhada;
	}
	
	public void run() {
		// TODO Auto-generated method stub
		while (true) {
            try {
            	contaCompartilhada.sacar((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 400));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
	}
}

class Pessoa5R implements Runnable {
	
	private ContaBancaria2 contaCompartilhada;

	public Pessoa5R(ContaBancaria2 contaCompartilhada) {
		this.contaCompartilhada = contaCompartilhada;
	}
	
	public void run() {
		// TODO Auto-generated method stub
		while (true) {
            try {
            	contaCompartilhada.depositar((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 500));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
	}
}

class Pessoa6R implements Runnable {
	
	private ContaBancaria2 contaCompartilhada;

	public Pessoa6R(ContaBancaria2 contaCompartilhada) {
		this.contaCompartilhada = contaCompartilhada;
	}
	
	public void run() {
		// TODO Auto-generated method stub
		while (true) {
            try {
            	contaCompartilhada.sacar((int) (Math.random() * 100));
            	contaCompartilhada.obterSaldo();
            	contaCompartilhada.depositar((int) (Math.random() * 100));
            	contaCompartilhada.obterSaldo();
                Thread.sleep(100 + (int) (Math.random() * 600));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
	}
}

//--------------------------- Final impelentacao das pessoas  --------------------------- 

class ContaBancaria2 {
    private AtomicInteger saldo;
    
    public ContaBancaria2() {
        this.saldo = new AtomicInteger(0);
    }

    public ContaBancaria2(int saldoInicial) {
        this.saldo = new AtomicInteger(saldoInicial);
    }

    public synchronized void obterSaldo() {
    	System.out.println("Seu saldo é $" + this.saldo.get());
    }

    public synchronized void depositar(int valor) {
    	if(valor < 0) {
    		System.out.println("Impossível depositar valores negativos");
    	} else {
    		
    		this.saldo.addAndGet(valor);
    		System.out.println("Valor depositado");
    	}
    }

    public void sacar(int valor) {
		if ((this.saldo.get() - valor) < 0) {
			System.out.println("Impossível sacar o valor - Saldo insuficiente");
		} else {
			System.out.println("Saque realizado");
		}
	}
}