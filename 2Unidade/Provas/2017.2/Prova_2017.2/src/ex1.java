public class ex1  {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final ContaBancaria contaCompartilhada = new ContaBancaria();
		
		Pessoa1 pessoa1 = new Pessoa1(contaCompartilhada);
		Pessoa2 pessoa2 = new Pessoa2(contaCompartilhada);
		Pessoa3 pessoa3 = new Pessoa3(contaCompartilhada);
		Pessoa4 pessoa4 = new Pessoa4(contaCompartilhada);
		Pessoa5 pessoa5 = new Pessoa5(contaCompartilhada);
		Pessoa6 pessoa6 = new Pessoa6(contaCompartilhada);
		
		new Thread(pessoa1).start();
		new Thread(pessoa2).start();
		new Thread(pessoa3).start();
		new Thread(pessoa4).start();
		new Thread(pessoa5).start();
		new Thread(pessoa6).start();
		

	}
	
}	

// --------------------------- Inicio impelentacao das pessoas  --------------------------- 

class Pessoa1 implements Runnable {
	
	private ContaBancaria contaCompartilhada;

	public Pessoa1(ContaBancaria contaCompartilhada) {
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

class Pessoa2 implements Runnable {
	
	private ContaBancaria contaCompartilhada;

	public Pessoa2(ContaBancaria contaCompartilhada) {
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

class Pessoa3 implements Runnable {
	
	private ContaBancaria contaCompartilhada;

	public Pessoa3(ContaBancaria contaCompartilhada) {
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

class Pessoa4 implements Runnable {
	
	private ContaBancaria contaCompartilhada;

	public Pessoa4(ContaBancaria contaCompartilhada) {
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

class Pessoa5 implements Runnable {
	
	private ContaBancaria contaCompartilhada;

	public Pessoa5(ContaBancaria contaCompartilhada) {
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

class Pessoa6 implements Runnable {
	
	private ContaBancaria contaCompartilhada;

	public Pessoa6(ContaBancaria contaCompartilhada) {
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

class ContaBancaria {
    private int saldo;
    
    public ContaBancaria() {
        this.saldo = 0;
    }

    public ContaBancaria(int saldoInicial) {
        this.saldo = saldoInicial;
    }

    public synchronized void obterSaldo() {
    	System.out.println("Seu saldo é $" + saldo);
    }

    public synchronized void depositar(int valor) {
    	if(valor < 0) {
    		System.out.println("Impossível depositar valores negativos");
    	} else {
    		this.saldo += valor;
    		System.out.println("Valor depositado");
    	}
    }

    public void sacar(int valor) {
		if ((saldo - valor) < 0) {
			System.out.println("Impossível sacar o valor - Saldo insuficiente");
		} else {
			System.out.println("Saque realizado");
		}
	}
}