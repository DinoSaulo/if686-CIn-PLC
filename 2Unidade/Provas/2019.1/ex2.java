// Aluno Saulo Alexandre de Barros (SAB2)
public class ex2 {

    public static void main(String[] args) {
    	
    	// Descricao da ideia do codigo
    	// Uma fila bloqueante onde um produtor insere numeros aleatórios e o consumidor irá retirar esse numero depois
    	
    	int tamanhoMinhaFila = 10;
    	
    	filaDeInteiros fila = new filaDeInteiros(tamanhoMinhaFila);
    	
    	Produtor inserirNaFila = new Produtor(fila);
    	Consumidor retiraDaFila = new Consumidor(fila);
    	
        Thread threadProdutor = new Thread(inserirNaFila);
        Thread threadConsumidor = new Thread(retiraDaFila);
        
        threadProdutor.start();
        threadConsumidor.start();
    }

}

class Produtor implements Runnable {

    private filaDeInteiros produtor;

    public Produtor(filaDeInteiros produtor) {
        this.produtor = produtor;
    }

    public void run( ) {
    	try {
    		while(true) {
                this.produtor.push((int) (Math.random() * 100));
                Thread.sleep(500);
            } 
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

class Consumidor implements Runnable {

    private filaDeInteiros consumidor;

    public Consumidor(filaDeInteiros consumidor) {
        this.consumidor = consumidor;
    }

    public void run( ) {
    	try {
	        while(true) {
	        	this.consumidor.pop();
	            Thread.sleep(1500);
            } 
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}


class filaDeInteiros {
    private int[] fila;
    private int tamanho;

    public filaDeInteiros(int tamanho) {
        this.fila = new int[tamanho];
        this.tamanho = 0;
    }

    public synchronized void push(int valor) throws InterruptedException {
        while (this.tamanho == this.fila.length) {
        	System.err.println("Fila bloqueada por estar cheia");
            wait();
        }
        System.out.println("Colocando o inteiro " + valor + " na fila");
        this.fila[this.tamanho++] = valor;
        notifyAll();
    }

    public synchronized int pop() throws InterruptedException {
        while (this.tamanho == 0) {
            System.out.println("Fila vazia");
            wait();
        }
        int numeroRetirado = this.fila[0];
        System.out.println("Retirando o inteiro " + numeroRetirado + " da fila");
        for (int i = 0; i < this.tamanho - 1; i++) {
            this.fila[i] = this.fila[i + 1];
        }
        this.tamanho--;
        notifyAll();
        return numeroRetirado;
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