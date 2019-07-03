public class ex2 {

    public static void main(String[] args) {//throws InterruptedException {
    	fila bq = new fila(5);
    	int rodadas = 10;
    	
    	Thread1 thread1 = new Thread1(bq, rodadas);
    	Thread2 thread2 = new Thread2(bq, rodadas);
    	
        new Thread(thread2).start();
        new Thread(thread1).start();
    }

}

class Thread1 implements Runnable {

    private fila bq;
    private int rodadas;

    public Thread1(fila bq, int rodadas) {
        this.bq = bq;
        this.rodadas = rodadas;
    }

    public void run( ) {
        for (int i = 0; i<rodadas; i++) {
            try {
                this.bq.push((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 100));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            bq.getFila();
        }
    }
}

class Thread2 implements Runnable {

    private fila bq;
    private int rodadas;

    public Thread2(fila bq, int rodadas) {
        this.bq = bq;
        this.rodadas = rodadas;
    }

    public void run() {
        for (int i = 0; i<rodadas; i++) {
            try {
                this.bq.pop();
                Thread.sleep(200 + (int) (Math.random() * 100));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            bq.getFila();
        }
    }
}

class fila {
    private int[] fila;
    private int tamanho;

    public fila(int tamanho) {
        this.fila = new int[tamanho];
        this.tamanho = 0;
    }

    public synchronized void push(int valor) throws InterruptedException {
        while (this.tamanho == this.fila.length) {
            System.out.println("cheia, bloqueando!!");
            wait();
        }
        this.fila[this.tamanho++] = valor;
        System.out.println("Inserindo na fila : " + valor);
        notifyAll();
    }

    public synchronized int pop() throws InterruptedException {
        while (this.tamanho == 0) {
            System.out.println("fila vazia!");
            wait();
        }
        int ret = this.fila[0];
        for (int i = 0; i < this.tamanho - 1; i++) {
            this.fila[i] = this.fila[i + 1];
        }
        this.tamanho--;
        notifyAll();
        System.out.println("Retirando da fila : " + ret);
        return ret;
    }

    public synchronized int getSize() {
        return this.tamanho;
    }
    
    public synchronized void getFila() {
    	System.out.print("Fila = ");
    	for (int i = 0; i <= this.tamanho-1; i++) {
            System.out.print(this.fila[i] + " ");
        }
    	System.out.println("");
    }
}