package main

import (
	"fmt"
	"os"
	"strings"
)

func count(s string, sub string) (result uint32) {
	return uint32(strings.Count(s, sub))
}

func main() {
	if len(os.Args) != 3 {
		fmt.Println("Usage: go run main.go <string> <substring>")
		return
	}

	s := os.Args[1]
	sub := os.Args[2]

	result := count(s, sub)
	fmt.Printf("The substring '%s' appears %d times in the string '%s'.\n", sub, result, s)
}
