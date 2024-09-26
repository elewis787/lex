.PHONY: clean wit-go

default: wit-go

wit-go: ; wit-bindgen-go generate --world word --out ./gen/go/ ./wit

build-wasip1: ; tinygo build -tags purego -o main.wasm -target=wasip1

build-wasip2: ; tinygo build -tags purego -o main.wasm -target=wasip2 -wit-package ./wit --wit-world word

comp: wasm-tools component embed --world word ./wit/lex.wit main.wasm -o main.embed.wasm

wat: ; wasm-tools parse -t  main.wasm -o main.wat

clean: ; rm -rf ./gen/go/ 
