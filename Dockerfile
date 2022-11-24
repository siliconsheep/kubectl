FROM alpine:3

ARG ARCH
ARG KUBERNETES_RELEASE=v1.21.3

WORKDIR /bin

RUN apk add curl && \
  curl -fsSLO https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_RELEASE}/bin/linux/${ARCH}/kubectl && \
  chmod +x kubectl && \
  addgroup -S kubectl && \
  adduser -S kubectl -G kubectl

USER kubectl

ENTRYPOINT ["/bin/kubectl"]

CMD ["help"]
