install:
	apk add fish jq inkscape parallel convert zip 
	apk add font-fira-code --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ 
	echo "will cite" | parallel --citation

build: 
	fish ./build-all.fish
.PHONY: build

docker: 
	docker build -t cr.marsh.gg/marshians/logo .

push:
	docker push cr.marsh.gg/marshians/logo

run: 
	docker run --rm -p 8000:80 cr.marsh.gg/marshians/logo
