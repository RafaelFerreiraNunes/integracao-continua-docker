FROM golang:1.22

EXPOSE 8080

WORKDIR /app

ENV PORT 8080
ENV DB_HOST postgres
ENV DB_USER root
ENV DB_PASSWORD root
ENV DB_NAME root
ENV DB_PORT 5432

COPY assets/ assets/
COPY controllers/ controllers/
COPY database/ database/
COPY models/ models/
COPY routes/ routes/
COPY templates/ templates/
COPY main.go main.go
COPY go.mod go.mod
COPY go.sum go.sum

CMD [ "go", "run", "main.go" ]