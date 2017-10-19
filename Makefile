default: native

native:
	go build

cross-build: clean linux darwin windows

linux:
	GOOS=linux GOARCH=amd64 go build -o bin/Linux/x86_64/magic

darwin:
	GOOS=darwin GOARCH=amd64 go build -o bin/Darwin/x86_64/magic

windows:
	GOOS=windows GOARCH=amd64 go build -o bin/Windows/x86_64/magic.exe

docker: linux
	docker build -t carolynvs/magic .
	docker push carolynvs/magic
	docker run --rm carolynvs/magic

clean:
	 -rm -fr bin/*

.PHONY: clean native linux darwin windows
