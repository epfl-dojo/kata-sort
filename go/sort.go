package main

import "fmt"

func main() {
	array := [5]int{9, 7, 6, 7, 9}
	bubbleSort(array)
}

func bubbleSort(arr [5]int) {
	finished := false
	for !finished {
		finished = true
		for i := 0; i < 5-1; i++ {
			first := arr[i]
			second := arr[i+1]
			if arr[i] > arr[i+1] {
				fmt.Print("true")
				arr[i] = second
				arr[i+1] = first
				finished = false
			} else {
				fmt.Print("false")
			}
		}
	}
	for i := 0; i < 5; i++ {
		print(arr[i])
	}
}
