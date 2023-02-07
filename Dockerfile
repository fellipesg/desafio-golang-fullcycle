FROM golang:1.15-alpine AS builder

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN GOOS=linux go build -o /app/hello-world -ldflags='-s -w' .

FROM scratch

WORKDIR /app
COPY --from=builder /app/hello-world ./hello-world

ENTRYPOINT [ "./hello-world" ]
