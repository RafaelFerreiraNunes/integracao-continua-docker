FROM golang:1.22-alpine AS build

WORKDIR /app

COPY controllers/ controllers/
COPY database/ database/
COPY models/ models/
COPY routes/ routes/
COPY main.go main.go
COPY go.mod go.mod
COPY go.sum go.sum

RUN go build main.go

FROM alpine:latest AS production

EXPOSE 8080

WORKDIR /app

ENV PORT 8080
ENV DB_HOST postgres
ENV DB_USER root
ENV DB_PASSWORD root
ENV DB_NAME root
ENV DB_PORT 5432

COPY assets/ assets/
COPY templates/ templates/

COPY --from=build /app/main /app/main

CMD [ "./main" ]
