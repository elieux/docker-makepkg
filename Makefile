.PHONY: image
image: Dockerfile
	docker build - -t elieux/makepkg:latest < Dockerfile

.PHONY: upload
upload:
	docker push elieux/makepkg:latest
