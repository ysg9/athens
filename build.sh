#!/bin/sh

go mod tidy

VERSION="unset"
DATE="$(date -u +%Y-%m-%d-%H:%M:%S-%Z)"
BUILD_VER_VAR="github.com/gomods/athens/pkg/build.version"
BUILD_DATE_VAR="github.com/gomods/athens/pkg/build.buildDate"
GO111MODULE=on CGO_ENABLED=0 GOPROXY="https://proxy.golang.org" go build \
  -ldflags "-X ${BUILD_VER_VAR}=$VERSION -X ${BUILD_DATE_VAR}=$DATE" \
  -o athens-proxy ./cmd/proxy

# for deps scanning
go list -m all > go.list

