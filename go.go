package main

import (
	"devops-project/test"
	"fmt"
)

type Carro struct {
	marca  string
	modelo string
}

var carro1 = Carro{"Porche", "911 carrera"}

func main() {
	fmt.Println(carro1.marca)
	fmt.Println(test.Test(1))

}
