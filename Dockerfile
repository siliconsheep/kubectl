FROM --platform=$BUILDPLATFORM alpine:3

ARG TARGETARCH
ARG KUBERNETES_RELEASE=v1.24.1

WORKDIR /bin

RUN apk add curl && \
  uname -m && \
  curl -LO https://dl.k8s.io/release/${KUBERNETES_RELEASE}/bin/linux/${TARGETARCH}/kubectl && \
  chmod +x kubectl && \
  addgroup -S kubectl && \
  adduser -S kubectl -G kubectl

USER kubectl

ENTRYPOINT ["/bin/kubectl"]

CMD ["help"]
