BINARY_NAME := control-plane

# CONTAINER_ENGINE: container runtime command. Set to override; otherwise auto-detect podman or docker.
CONTAINER_ENGINE ?= $(shell \
	if command -v podman >/dev/null 2>&1; then \
		echo podman; \
	elif command -v docker >/dev/null 2>&1; then \
		echo docker; \
	fi)

# CONTAINER_IMAGE_NAME: FQDN (without tag) of the container image. Set to override
CONTAINER_IMAGE_NAME ?= quay.io/dcm-project/$(BINARY_NAME)

# CONTAINER_IMAGE_TAG: Container image tag. Set to override; otherwise git short hash is used
CONTAINER_IMAGE_TAG ?= $(shell git rev-parse --short HEAD 2>/dev/null || echo unknown)

build:
	go build -o bin/$(BINARY_NAME) ./cmd/$(BINARY_NAME)

run:
	go run ./cmd/$(BINARY_NAME)

clean:
	rm -rf bin/

fmt:
	gofmt -s -w .

vet:
	go vet ./...

lint:
	golangci-lint run ./...

test:
	go test ./...

tidy:
	go mod tidy

.PHONY: build run clean fmt vet lint test tidy
