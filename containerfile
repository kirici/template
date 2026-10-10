FROM --platform=$BUILDPLATFORM golang:1.27.2-alpine3.24 AS build
ARG TARGETOS TARGETARCH
ENV CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH
WORKDIR /src

COPY go.* ./
RUN --mount=type=cache,target=/go/pkg/mod go mod download

COPY . .
RUN --mount=type=cache,target=/go/pkg/mod --mount=type=cache,target=/root/.cache/go-build go build -trimpath -ldflags='-s -w' -o /out/bin .

FROM gcr.io/distroless/static-debian13:nonroot
ARG PORT=8080
ENV PORT=${PORT}
COPY --from=build /out/bin /app/bin
EXPOSE ${PORT}
ENTRYPOINT ["/app/bin"]
CMD ["run"]
