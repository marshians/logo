build: 
	fish ./build-all.fish
.PHONY: build

docker: 
	docker build -t cr.marsh.gg/marshians/logos .

push:
	docker push cr.marsh.gg/marshians/logos

run: 
	docker run --rm -p 8000:80 cr.marsh.gg/marshians/logos
