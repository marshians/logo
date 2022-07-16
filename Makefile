build: 
	fish ./build-all.fish
.PHONY: build

docker: 
	docker build -t cr.marsh.gg/marshians/logo .

push:
	docker push cr.marsh.gg/marshians/logo

run: 
	docker run --rm -p 8000:80 cr.marsh.gg/marshians/logo
