public class ex1  {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final Vector vetor = new Vector(2);
		
		int i = 0; // Thread na posicao 0
		int j = 1; // Thread na posicao 1
		
		new Thread(() -> {
			
			// Implemenando o get
			System.out.println("Get Thread-Vector i :" + vetor.get(i));
			System.out.println("Get Thread-Vector j :" + vetor.get(j));
			
			System.out.println("---------------------------------------------");
			
			// Implemenando o set
			vetor.set(i, 4002);
			vetor.set(j, 8922);
			
			// repetindo o get para visualizar 
			System.out.println("Get Thread-Vector i :" + vetor.get(i));
			System.out.println("Get Thread-Vector j :" + vetor.get(j));
			
			System.out.println("---------------------------------------------");
			
			// Implemenando o swap
        	vetor.swap(j, i);
        	
        	// repetindo o get para visualizar 
			System.out.println("Get Thread-Vector i :" + vetor.get(i));
			System.out.println("Get Thread-Vector j :" + vetor.get(j));
            
            
        }).start();
		

	}
	
	public static class Vector {
        private final int[] vector;

        public Vector(int size) {
            this.vector = new int[size];
        }

        public int get(int index) {
            synchronized (this.vector) {
                return this.vector[index];
            }
        }

        public void set(int index, int value) {
            synchronized (this.vector) {
                this.vector[index] = value;
            }
        }

        public void swap(int from, int to) {
    		synchronized (this.vector) {
    			int temp = this.vector[from];
    			this.vector[from] = this.vector[to];
    			this.vector[to] = temp;
    		}
    	}
    }
	

}
