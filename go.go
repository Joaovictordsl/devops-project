package main

import "fmt"

func binary(array []int, target int) int {
	low := 0
	high := len(array) - 1

	for low <= high {
		mid := (low + high) / 2
		guess := array[mid]

		if guess == target {
			return mid
		} else if target < guess {
			high = mid - 1
		} else {
			low = mid + 1
		}

	}

	return -1
}

func main() {
	x := []int{1, 2, 3, 4, 10, 55, 68, 70, 120, 520}

	fmt.Println(binary(x, 10))
}
