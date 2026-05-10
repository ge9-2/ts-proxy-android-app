GOOS ?= $(shell go env GOOS)
GOEXE ?= $(shell go env GOEXE)

ts-proxy$(GOEXE): *.go cmd/*.go
ifeq ($(GOOS),android)
	android-patch/patch.sh
	go build -ldflags "-checklinkname=0 -s -w" -trimpath -o ts-proxy$(GOEXE) cmd/*
else
	go build -ldflags "-s -w" -trimpath -o ts-proxy$(GOEXE) cmd/*
endif
