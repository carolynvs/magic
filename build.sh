#! /bin/bash
set -e

PACKAGE="github.com/carolynvs/magic"

# Let's make some magic
echo "Building all targets with $(go version)"
GOOS=linux GOARCH=amd64 go build -o bin/Linux/x86_64/magic $PACKAGE
GOOS=darwin GOARCH=amd64 go build -o bin/Darwin/x86_64/magic $PACKAGE
GOOS=windows GOARCH=amd64 go build -o bin/Windows/x86_64/magic.exe $PACKAGE
