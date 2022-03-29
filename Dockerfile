FROM golang:latest AS builder

WORKDIR /app

COPY . .

ENV PORT 8080 

RUN go build -o GoTestDrone

FROM alpine

WORKDIR /app

COPY --from=builder /app/GoTestDrone /app/

CMD ["./GoTestDrone"]