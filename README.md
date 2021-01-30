# Go Development Image

A simple image used for development of Go applications.

Features:
- Hot reloading
- Configurable file extensions to watch

Enables hot reloading when files are changed. The file extensions watched can be configured via an environment variable provided to the Docker image. Files in the `/app` directory are watched. As such, a volume should be opened from the host machine to the container's `/app` directory.

The underlying hot reloading is provided via [cespare/reflex](https://github.com/cespare/reflex). The application is run and reloaded using `go run .`.

## Usage

Docker Compose provides an easy way to use this in conjunctions with other servers. The following `docker-compose.yml` illustrates how to define a service using the Go Development Image.

```
services:
  server:
    image: ghcr.io/moyen-blog/go-dev:latest
    volumes:
      - .:/app # Open volume to host project directory
      - server:/go/pkg/mod
volumes:
  server:
```

To configure watched file extensions, provide the extensions to the container separated by pipe characters. The `.` (period) prefix of the file extensions should not be included. By default, watched extensions include `.go`, `.gohtml`, and `.css`. This translates to an `EXT` environment variable of `go|gohtml|css`.

The following `docker-compose.yml` file creates a service that watches `.go` and `.c` files.

```
services:
  server:
    image: ghcr.io/moyen-blog/go-dev:latest
    environment:
      - EXT=go|c # Watch .go and .c files
    volumes:
      - .:/app # Open volume to host project directory
      - server:/go/pkg/mod
volumes:
  server:
```
