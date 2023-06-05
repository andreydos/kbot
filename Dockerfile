FROM quay.io/projectquay/golang:1.20 as builder
ARG TARGETARCH TARGETOS

WORKDIR /go/src/app
COPY . .
RUN go get
RUN make build TARGETARCH=$TARGETARCH TARGETOS=$TARGETOS

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/kbot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./kbot", "start" ]