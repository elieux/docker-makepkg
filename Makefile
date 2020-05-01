.PHONY: image
image: Dockerfile
	docker build - -t elieux/makepkg:latest < Dockerfile
