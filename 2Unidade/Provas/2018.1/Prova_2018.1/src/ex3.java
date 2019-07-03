public class ex3 {

    public static void main(String[] args) {//throws InterruptedException {
    	
    	int capacidadeDoForno = 50;
    	int paesPorFornada = 10;
    	int fornada = capacidadeDoForno / paesPorFornada; 
    	
    	filaDoForno bq = new filaDoForno(fornada);
    	int rodadas = 10;
    	
    	InserirForno inserirForno = new InserirForno(bq);
    	RetiraForno retiraForno = new RetiraForno(bq);
    	
        new Thread(inserirForno).start();
        new Thread(retiraForno).start();
    }

}

class InserirForno implements Runnable {

    private filaDoForno bq;

    public InserirForno(filaDoForno bq) {
        this.bq = bq;
    }

    public void run( ) {
        while(true) {
            try {
                this.bq.push(10);
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class RetiraForno implements Runnable {

    private filaDoForno bq;

    public RetiraForno(filaDoForno bq) {
        this.bq = bq;
    }

    public void run( ) {
        while(true) {
            try {
                this.bq.pop();
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}


class filaDoForno {
    private int[] fila;
    private int tamanho;

    public filaDoForno(int tamanho) {
        this.fila = new int[tamanho];
        this.tamanho = 0;
    }

    public synchronized void push(int valor) throws InterruptedException {
        while (this.tamanho == this.fila.length) {
            System.out.println("Forno cheio, bloqueando!!");
            wait();
        }
        this.fila[this.tamanho++] = valor;
        System.out.println("Inserindo 10 pães");
        System.out.println(tamanho*10 + " / 50 pães no forno");
        notifyAll();
    }

    public synchronized int pop() throws InterruptedException {
        while (this.tamanho == 0) {
            System.out.println("Forno Vazio!");
            wait();
        }
        int ret = this.fila[0];
        for (int i = 0; i < this.tamanho - 1; i++) {
            this.fila[i] = this.fila[i + 1];
        }
        this.tamanho--;
        notifyAll();
        System.err.println("10 pães prontos - RETIRANDO");
        return ret;
    }

    public synchronized int getSize() {
        return this.tamanho;
    }
    
    public synchronized boolean estaCheio() {
        if(this.tamanho == fila.length) {
        	return true;
        } else {
        	return false;
        }
    }
}