public class Slide11_Ex1 implements Runnable {

	public static void main(String[] args) {
		
		int numThreads = 50;
		Slide11_Ex1 te = new Slide11_Ex1();
		Thread[] arrayThreads = new Thread[numThreads];

		for (int i = 0; i < numThreads; i++) {
			arrayThreads[i] = new Thread(te);
			arrayThreads[i].start();
		}
	}
	
	static int contador = 1;

	public Slide11_Ex1() {
		//faz nada
	}

	static synchronized void incrementCounter() {
		System.out.println(Thread.currentThread().getName() + ": " + contador);
		contador++;
	}

	@Override
	public void run() {
		while (contador < 2000000000) {
			incrementCounter();
		}
	}
}