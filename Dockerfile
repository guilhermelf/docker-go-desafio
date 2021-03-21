FROM golang:alpine AS go

WORKDIR /usr/src/app

COPY main.go /usr/src/app

RUN go build main.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=go /usr/src/app .
CMD ["./main"]