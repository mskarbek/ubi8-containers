mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

-include ../common/args.mk

build: Containerfile
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(base_release)\
	 --squash\
	 -t $(registry)/$(repository_prefix)/$(current_dir):$(tag)-$(release) .
