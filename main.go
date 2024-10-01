package main

import (
	"fmt"
	"strings"

	"github.com/elewis787/lex/gen/go/elewis787/lex/word"
)

func count(s string, sub string) (result uint32) {
	fmt.Println("here")
	return uint32(strings.Count(s, sub))
}

func init() {
	word.Exports.Count = count
}

func main() {
	/*if len(os.Args) != 3 {
		fmt.Println("Usage: go run main.go <string> <substring>")
		return
	}

	s := os.Args[1]
	sub := os.Args[2]

	result := count(s, sub)
	fmt.Printf("The substring '%s' appears %d times in the string '%s'.\n", sub, result, s)
	*/
}
