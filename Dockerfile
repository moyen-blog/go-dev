FROM golang:1.16
ENV EXT=go|gohtml|css
WORKDIR /app
RUN go get github.com/cespare/reflex
CMD reflex -r "\.($EXT)" -s -- sh -c "go run ."
