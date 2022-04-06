FROM golang:latest AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 go build -o GoTestDrone

FROM alpine

WORKDIR /app

COPY --from=builder /app/GoTestDrone /app/

ENV PORT 8080 

CMD ["./GoTestDrone"]