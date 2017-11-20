//
// Programa 1
//
// Eleva ao quadrado os N elementos de um vetor e calcula a soma.

package main

import (
  "flag"
  "fmt"
  "math/rand"
  "strconv"
  )
  
func soma_quadrados_thread(vetor []float64, c chan float64) {
  soma := 0.
  for _, e := range vetor {
    soma += e*e
  }
  c <- soma
}


func main() {

  flag.Parse()
  arg := flag.Arg(0)
  n, _ := strconv.Atoi(arg)

  var vetor = make([]float64, n)
  for i := range vetor {
    vetor[i] = rand.Float64()
  }
  
  
  c := make(chan float64)
  go soma_quadrados_thread(vetor[:len(vetor)/2], c)
  go soma_quadrados_thread(vetor[len(vetor)/2:], c)
  
  a, b := <-c, <-c
  
  fmt.Println(a+b)
}