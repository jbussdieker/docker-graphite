REGISTRY ?= localhost:5000
IMAGE_NAME ?= graphite-alpine

all: build

build:
	docker build -t $(REGISTRY)/$(IMAGE_NAME) .
push: build
	docker push $(REGISTRY)/$(IMAGE_NAME)
run:
	docker run -it $(REGISTRY)/$(IMAGE_NAME)
login: build
	docker run -it $(REGISTRY)/$(IMAGE_NAME) /bin/sh
