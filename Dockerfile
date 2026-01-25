FROM golang:alpine AS builder

WORKDIR /app
COPY hello.go .

ENV CGO_ENABLED=0 
ENV GOOS=linux 
RUN go build -ldflags="-s -w" -o hello hello.go

FROM scratch
COPY --from=builder /app/hello /hello
CMD ["/hello"]