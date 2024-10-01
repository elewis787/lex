.PHONY: clean wit-go

default: wit-go

wit-go: ; wit-bindgen-go generate --world word --out ./gen/go/ ./wit

build-wasip1-go: ; GOOS=wasip1 GOARCH=wasm go build -o main.wasm main.go

build-wasip1-tiny: ; tinygo build -o main.wasm -target=wasip1 

build-wasip2-tiny: ; tinygo build -tags purego -o main.wasm -target=wasip2 

reactor: $(wildcard wasi_snapshot_preview1.reactor.wasm) download-reactor 
	wasm-tools component embed --world word ./wit/lex.wit main.wasm -o main.embed.wasm
	wasm-tools component new -o main.component.wasm --adapt wasi_snapshot_preview1=wasi_snapshot_preview1.reactor.wasm main.embed.wasm

command: $(wildcard wasi_snapshot_preview1.command.wasm) download-command build-wasip1-tiny
	wasm-tools component embed --world word ./wit main.wasm -o main.embed.wasm
	wasm-tools component new -o main.component.wasm --adapt wasi_snapshot_preview1=wasi_snapshot_preview1.command.wasm main.embed.wasm

wat: ; wasm-tools parse -t main.wasm -o main.wat

show-wit: ; wasm-tools component wit main.wasm 

download-reactor:
	@echo "Downloading wasip1 reactor file..."
	curl -L https://github.com/bytecodealliance/wasmtime/releases/download/v25.0.1/wasi_snapshot_preview1.reactor.wasm -o wasi_snapshot_preview1.reactor.wasm
	@echo "Download complete: wasi_snapshot_preview1.reactor.wasm"

download-command:
	@echo "Downloading wasip1 command file..."
	curl -L https://github.com/bytecodealliance/wasmtime/releases/download/v25.0.1/wasi_snapshot_preview1.command.wasm -o wasi_snapshot_preview1.command.wasm
	@echo "Download complete: wasi_snapshot_preview1.command.wasm"

clean: ; rm -rf ./gen/go/ & rm -f *.wasm **/*.wasm
