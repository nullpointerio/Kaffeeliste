##################################################
FROM golang:1.17.2 as build
WORKDIR /build
ADD kaffeeliste.go .
ADD go.sum .
ADD go.mod .
RUN go build kaffeeliste.go

##################################################
FROM alpine:3.14
COPY --from=build /build/kaffeeliste /usr/local/bin
CMD /opt/kaffeeliste