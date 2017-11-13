/**
 * Programa 1
 * 
 * Eleva ao quadrado os N elementos de um vetor e calcula a soma.
 */

public class Main {

  public static void main (String[] args) {
    
    float[] v = {1,2,3,4,5};
    Vetor a = new Vetor(v);
    System.out.println(a.somaQuadrados());
    
    
  }
  
}

class Vetor {
  
  private float[] valores;
  
  public Vetor(float[] valores) {
    this.valores = valores;
  }
  
  public float somaQuadrados() {
    float s = 0;
    
    for (float e : this.valores) {
      s += (e * e);
    }
    
    return s;
  }
  
}