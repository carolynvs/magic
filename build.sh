#! /bin/bash

# Get our magical dependencies
go get github.com/Masterminds/glide
glide install

# Let's make some magic
GOOS=linux GOARCH=amd64 go build -o bin/Linux/x86_64/magic
GOOS=darwin GOARCH=amd64 go build -o bin/Darwin/x86_64/magic
GOOS=windows GOARCH=amd64 go build -o bin/Windows/x86_64/magic.exe
