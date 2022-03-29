FROM golang:latest AS builder

WORKDIR /app

COPY . .

ENV PORT 8080 

RUN go build

FROM alpine

WORKDIR /app

COPY --from=builder /app/GoTestDrone /app/

RUN apk add --no-cache bash

CMD ["./GoTestDrone"]