package main

import "fmt"

type Carro struct {
	marca  string
	modelo string
}

var carro1 = Carro{"Porche", "911 carrera"}

func main() {
	fmt.Println(carro1.marca)
}
