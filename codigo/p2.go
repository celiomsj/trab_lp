//
// Programa 2
//
// Multiplicar duas matrizes quadráticas de dimensão NxN

package main

import (
  "fmt"
  )

  
func multiplica_matriz_thread(l1 []int, c2 []int, c chan int) {
  e := 0
  // for i:= range l1 {
  //   for j:= range c2 {
  //     e += l1[i] * c2[j]
  //   }
  // }
  for i:= range l1 {
    fmt.Printf("multiplicando %v e %v\n", l1[i], c2[i])
    e += l1[i] * c2[i]
  }
  fmt.Printf(" = %v\n", e)
  c <- e
}

func get_coluna(matriz [][]int, indice int) []int {
  coluna := make([]int, 0)
  for _, linha := range matriz {
    coluna = append(coluna, linha[indice])
  }
  return coluna
}
  
func main() {
  m1 := [][]int{{1, 2}, {3, 4}}
  m2 := [][]int{{1, 2}, {3, 4}}
  mr := [][]int{{0,0},{0,0}} 
  ch := make(chan int)
  
  
  for i:= range m1 { // itera sobre os indices de linhas de m1
    for j:= range m2[0] { // itera sobre os indices de colunas de m2
      // fmt.Println(m1[i][j])
      // fmt.Println(m2[i][j])
      
      // go multiplica_matriz_thread(m1[i], m2, j, ch)
      go multiplica_matriz_thread(m1[i], get_coluna(m2, j), ch)
      numero := <-ch
      mr[i][j] = numero
    }
  }
  
  for i:= range mr {
    for j:= range mr[i] {
      fmt.Printf("%d ", mr[i][j])
    }
    fmt.Printf("\n")
  }
  
  
}