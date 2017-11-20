/**
  Programa 1
  
  Eleva ao quadrado os N elementos de um vetor e calcula a soma.
 */

import java.util.Random;

public class p1 {

  public static void main (String[] args) {
    
    int n = Integer.parseInt(args[0]);
    float[] v = new float[n];
    Random rng = new Random();
    for (int i = 0; i < n; i++) {
      v[i] = rng.nextFloat();
    }
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