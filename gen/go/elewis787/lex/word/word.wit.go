// Code generated by wit-bindgen-go. DO NOT EDIT.

// Package word represents the world "elewis787:lex/word@0.0.1".
package word

import (
	"github.com/bytecodealliance/wasm-tools-go/cm"
)

//go:wasmexport count
//export count
func wasmexport_Count(s0 *uint8, s1 uint32, sub0 *uint8, sub1 uint32) (result0 uint32) {
	s := cm.LiftString[string]((*uint8)(s0), (uint32)(s1))
	sub := cm.LiftString[string]((*uint8)(sub0), (uint32)(sub1))
	result := Exports.Count(s, sub)
	result0 = (uint32)(result)
	return
}
