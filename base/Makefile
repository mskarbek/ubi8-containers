mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

-include ../common/args.mk

build:
	@podman build\
	 --squash-all\
	 -t $(registry)/$(repository)/$(current_dir):$(tag)-$(release) .
