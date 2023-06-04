VERSION: $(shell git describe --tags --abbrev=0)-$(shell git re-parse --short HEAD)

format:
	gofmt -s -w ./

build:
	go build -v -o kbot -ldflags "-X="github.com/andreydos/kbot/cmd.appVersion=${VERSION}