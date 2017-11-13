/**
  Programa 2
  
  Multiiplicar duas matrizes quadráticas de dimensões NxN.
 */

public class Main {

  public static void main (String[] args) {
    
    float[][] m = {
      {1,2},
      {3,4,}
    };
    Matriz a = new Matriz(m);
    a.multiplicaMatriz(a).printMatriz();
    
    
  }
  
}

class Matriz {
  
  private float[][] valores;
  
  public Matriz(float[][] valores) {
    this.valores = valores;
  }
  
  public Matriz(int m, int n) {
    this.valores = new float[m][n];
  }
  
  public void printMatriz() {
    for (float[] linha : this.valores) {
      for (float e : linha) {
        System.out.print(e + "\t");
      }
      System.out.println();
    }
  }
  
  public Matriz multiplicaMatriz(Matriz b) {
    

    int l1 = this.valores.length;
    int c1 = this.valores[0].length;
    int l2 = b.valores.length;
    int c2 = b.valores[0].length;

    Matriz m = new Matriz(l1, c2);
  
    // if c1 == l2
    
    for (int i = 0; i < l1; i++) {
      for (int j = 0; j < c2; j++) {
        m.valores[i][j] = 0;

        for (int a = 0; a < c1; a++) {
          m.valores[i][j] += (this.valores[i][a] * b.valores[a][j]);
        }
      }
    }
    
    return m;
  }
  
}
