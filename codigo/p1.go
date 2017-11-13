//
// Programa 1
//
// Eleva ao quadrado os N elementos de um vetor e calcula a soma.

package main

import (
  "fmt"
  )
  
func soma_quadrados_thread(vetor []int, c chan int) {
  soma := 0
  for _, e := range vetor {
    soma += e*e
  }
  c <- soma
}

func main() {
  vetor := []int{1, 2, 3, 4, 5}
  
  c := make(chan int)
  go soma_quadrados_thread(vetor[:len(vetor)/2], c)
  go soma_quadrados_thread(vetor[len(vetor)/2:], c)
  
  a, b := <-c, <-c
  
  fmt.Println(a, b, a+b)
}