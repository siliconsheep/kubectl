#!/bin/bash

KUBERNETES_RELEASE="${1:-v1.24.1}"

docker buildx build --build-arg KUBERNETES_RELEASE=${KUBERNETES_RELEASE} --push --platform linux/arm64/v8,linux/amd64 --tag ghcr.io/siliconsheep/kubectl:${KUBERNETES_RELEASE} .
