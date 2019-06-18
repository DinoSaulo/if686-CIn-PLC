public class ex4 {

	public static void main(String[] args) {
		
		ThreadSemafaro semafaro = new ThreadSemafaro();
		
		for (int i=0; i<10; i++){
			System.out.println(semafaro.getCor());
			semafaro.esperaCorMudar();
		}
		
		semafaro.donw();
	}

}

enum CorSemafaro {
	
	VERDE(1000), AMARELO(300), VERMELHO(2000);
	
	private int tempoEspera;
	
	CorSemafaro(int tempoEspera){
		this.tempoEspera = tempoEspera;
	}

	public int getTempoEspera() {
		return tempoEspera;
	}
}

class ThreadSemafaro implements Runnable {

	private CorSemafaro cor;
	private boolean parar;
	private boolean corMudou;

	public ThreadSemafaro(){
		this.cor = CorSemafaro.VERMELHO;

		this.parar = false;
		this.corMudou = false;

		new Thread(this).start();
	}

	@Override
	public void run() {

		while(!parar){
			try {
				Thread.sleep(this.cor.getTempoEspera());
				this.up();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	private synchronized void up(){
		switch (this.cor) {
		case VERMELHO:
			this.cor = CorSemafaro.VERDE;
			break;
		case AMARELO:
			this.cor = CorSemafaro.VERMELHO;
			break;
		case VERDE:
			this.cor = CorSemafaro.AMARELO;
			break;
		default:
			break;
		}
		this.corMudou = true;
		notify();
	}
	
	public synchronized void esperaCorMudar(){
		while(!this.corMudou){
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		this.corMudou = false;
	}
	
	public synchronized void donw(){
		this.parar = true;
	}

	public CorSemafaro getCor() {
		return cor;
	}
}