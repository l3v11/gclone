SHELL = bash
# Branch we are working on
BRANCH := main
# Tag of the current commit for building a release
TAG := $(shell git tag -l --points-at HEAD)
# Version of rclone release
VERSION := $(shell cat VERSION)
GO_VERSION := $(shell go version)
# Pass in GOTAGS=xyz on the make command line to set build tags
ifdef GOTAGS
BUILDTAGS=-tags "$(GOTAGS)"
endif

vars:
	@echo SHELL="'$(SHELL)'"
	@echo BRANCH="'$(BRANCH)'"
	@echo TAG="'$(TAG)'"
	@echo VERSION="'$(VERSION)'"
	@echo GO_VERSION="'$(GO_VERSION)'"

# Get the release dependencies we only install on linux
release_dep_linux:
	go run bin/get-github-release.go -extract nfpm goreleaser/nfpm 'nfpm_.*_Linux_x86_64\.tar\.gz'

# Get the release dependencies we only install on Windows
release_dep_windows:
	GO111MODULE=off GOOS="" GOARCH="" go get github.com/josephspurrier/goversioninfo/cmd/goversioninfo

upload_github: cross
	./bin/upload-github $(TAG)

cross:
	go run bin/cross-compile.go -release current $(BUILD_FLAGS) $(BUILDTAGS) $(BUILD_ARGS) $(TAG)
