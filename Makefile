PACKAGE=github.com/carolynvs/magic

default: cross-build

get-deps:
	@echo "Installing glide..."
	go get github.com/Masterminds/glide
	glide install

cross-build: clean get-deps linux darwin windows

linux: $(GOFILES) get-deps
	GOOS=linux GOARCH=amd64 go build -o bin/Linux/x86_64/magic $(PACKAGE)

darwin: $(GOFILES) get-deps
	GOOS=darwin GOARCH=amd64 go build -o bin/Darwin/x86_64/magic $(PACKAGE)

windows: $(GOFILES) get-deps
	GOOS=windows GOARCH=amd64 go build -o bin/Windows/x86_64/magic.exe $(PACKAGE)

.PHONY: clean

clean:
	 -rm -fr bin/*