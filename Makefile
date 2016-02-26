UID=$(shell id -u)
GID=$(shell id -g)

linux:
	docker run -v /home/danny/sandbox/docker/ehk:/go/bin --rm golang:latest /bin/bash -c "go get -d golang.org/x/net ;\
		go get -d golang.org/x/tools ;\
		go get -d golang.org/x/tools/cmd/present ;\
		cd /go/src/golang.org/x/tools/cmd/present;\
		cp -r /go/src/golang.org/x/tools/cmd/present/{static,templates} /go/bin;\
		CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/present_linux_amd64 ;\
		chown $(UID):$(GID) /go/bin/present* "

all:
	docker run -v /home/danny/sandbox/docker/ehk:/go/bin --rm golang:latest /bin/bash -c "go get -d golang.org/x/net ;\
		go get -d golang.org/x/tools ;\
		go get -d golang.org/x/tools/cmd/present ;\
		cd /go/src/golang.org/x/tools/cmd/present;\
		CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/present_linux_amd64 ;\
		CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -o /go/bin/present_linux_386 ;\
		CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o /go/bin/present_osx_amd64 ;\
		CGO_ENABLED=0 GOOS=darwin GOARCH=386 go build -o /go/bin/present_osx_386 ;\
		CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o /go/bin/present_amd64.exe ;\
		CGO_ENABLED=0 GOOS=windows GOARCH=386 go build -o /go/bin/present_i386.exe ;\
		cp -r /go/src/golang.org/x/tools/cmd/present/{static,templates} /go/bin;\
		chown $(UID):$(GID) /go/bin/present* "

docker:
	docker build -t bogue1979/ehk .
