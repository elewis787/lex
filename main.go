package main

import (
	"strings"

	"github.com/elewis787/lex/gen/go/elewis787/lex/word"
)

func count(s string, sub string) (result uint32) {
	return uint32(strings.Count(s, sub))

}

func init() {
	word.Exports.Count = count
}

func main() {}
