FROM golang:1.17 as build

COPY . /src

WORKDIR /src

RUN CGO_ENABLED=0 GOOS=linux go build -o golang_docker

FROM scratch AS production

COPY *.tmpl /

COPY --from=build /src/golang_docker /golang_docker

EXPOSE 8080

CMD ["/golang_docker"]
