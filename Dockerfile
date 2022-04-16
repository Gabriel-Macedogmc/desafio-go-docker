FROM golang:1.18-alpine3.14 AS builder

WORKDIR /usr/app

RUN go mod init Gabriel-Macedogmc/hello-golang

COPY index.go .

RUN go build -o bin/hello-golang

FROM scratch
WORKDIR /usr/app
COPY --from=builder /usr/app .

CMD [ "bin/hello-golang" ]