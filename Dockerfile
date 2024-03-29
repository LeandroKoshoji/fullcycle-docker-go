# Estágio de compilação
FROM golang:alpine AS builder

WORKDIR /app
COPY . .
RUN go mod init fullcycle && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /app/main .
CMD ["./main"]
