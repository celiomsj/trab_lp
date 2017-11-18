//
// Programa 2
//
// Multiplicar duas matrizes quadráticas de dimensão NxN

package main

import (
  "flag"
  "fmt"
  "math/rand"
  "strconv"
  )

  
func multiplica_matriz_thread(l1 []float64, c2 []float64, c chan float64) {
  e := 0.

  for i:= range l1 {
    // fmt.Printf("multiplicando %v e %v\n", l1[i], c2[i])
    e += l1[i] * c2[i]
  }
  // fmt.Printf(" = %v\n", e)
  c <- e
}

func get_coluna(matriz [][]float64, indice int) []float64 {
  coluna := make([]float64, 0)
  for _, linha := range matriz {
    coluna = append(coluna, linha[indice])
  }
  return coluna
}
  
func main() {

  flag.Parse()
  arg := flag.Arg(0)
  n, _ := strconv.Atoi(arg)

  var m1 = make([][]float64, n)  // slice de n slices
  var m2 = make([][]float64, n)
  var mr = make([][]float64, n)
  ch := make(chan float64)


  for i:= range m1 {
    m1[i] = make([]float64, n)  // inicializa slice interna
    m2[i] = make([]float64, n)
    mr[i] = make([]float64, n)
    for j:= range m1[0] {
      m1[i][j] = rand.Float64()
      m2[i][j] = rand.Float64()
    }
  }
  
  
  for i:= range m1 { // itera sobre os indices de linhas de m1
    for j:= range m2[0] { // itera sobre os indices de colunas de m2
      
      go multiplica_matriz_thread(m1[i], get_coluna(m2, j), ch)
      numero := <-ch
      mr[i][j] = numero
    }
  }
  
  for i:= range mr {
    for j:= range mr[i] {
      fmt.Printf("%v ", mr[i][j])
    }
    fmt.Printf("\n")
  }
  
  
}