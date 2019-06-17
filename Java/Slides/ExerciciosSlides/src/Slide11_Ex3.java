public class Slide11_Ex3 {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		MinhaThread2 thread = new MinhaThread2("Thread #1", 6);
		MinhaThread2 thread2 = new MinhaThread2("Thread #2", 9);
		MinhaThread2 thread3 = new MinhaThread2("Thread #3", 15);

		Thread t1 = new Thread(thread);
        Thread t2 = new Thread(thread2);
        Thread t3 = new Thread(thread3);
        
		t1.start();
        t2.start();
        t3.start();
        
        boolean flag = true;
        while (flag) {
        	//int val1 = thread.getContador();
        	//int val2 = thread2.getContador();
        	//int val3 = thread3.getContador();
        	
        	// Não conseguir implementar uma forma de mostrar onde o contador de cada thread parou
        	if(!t1.isAlive() || !t2.isAlive() || !t3.isAlive()) {
        		
        		if(!t1.isAlive()) {
        			t2.suspend();
        			t3.suspend();
        			
        		}
        		if(!t2.isAlive()) {
        			
        			t1.suspend();
        			t3.suspend();
        			
        		} 
        		if(!t3.isAlive()) {
        			
        			t2.suspend();
        			t1.suspend();
        			
        		}
        		
        		
            	System.out.println("Acabou");
            	flag = false;
            }
        }
	}
}

class MinhaThread2 implements Runnable {
	private String nome;
	private int limite;
	int i = 0;

	public MinhaThread2(String nome, int limite) {
		this.nome = nome;
		this.limite = limite;
	}
	
	public synchronized int getContador() {
		return this.i;
	}

	public synchronized void run() {
		for(i=0; i<limite; i++) {
			System.out.println(nome + " contador " + i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(nome + " terminou a execução!");
	}
}

// a - Provavelmente por que não há synchronized implementado na classe
// b - Irá modificar intencionalmente a variável
