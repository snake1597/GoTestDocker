FROM golang:latest

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN go build

CMD ["./GoTestDrone"]