registry = registry.skarbek.name
repository = ubi8
tag = 2021.01.13
release = 1

.PHONY: base systemd base-all systemd-all all

all: base-all systemd-all

systemd-all: systemd systemd-openjdk systemd-nodejs systemd-services

systemd-openjdk: systemd-openjdk8 systemd-openjdk11

systemd-openjdk8: systemd-openjdk8-jre systemd-openjdk8-jdk

systemd-openjdk8-jre:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd/openjdk8-jre:$(tag)-$(release) openjdk8-jre/

systemd-openjdk8-jdk:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd/openjdk8-jre\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd/openjdk8-jdk:$(tag)-$(release) openjdk8-jdk/

systemd-openjdk11: systemd-openjdk11-jre systemd-openjdk11-jdk

systemd-openjdk11-jre:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd/openjdk11-jre:$(tag)-$(release) openjdk11-jre/

systemd-openjdk11-jdk:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd/openjdk11-jre\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd/openjdk11-jdk:$(tag)-$(release) openjdk11-jdk/

systemd-nodejs: systemd-nodejs10 systemd-nodejs14

systemd-nodejs10:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd/nodejs10:$(tag)-$(release) nodejs10/

systemd-nodejs14:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd/nodejs14:$(tag)-$(release) nodejs14/

systemd-services: openssh nginx minio

openssh:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/openssh:$(tag)-$(release) openssh/

nginx:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/nginx:$(tag)-$(release) nginx/

minio:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/systemd\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/minio:$(tag)-$(release) minio

base-all: base base-openjdk base-nodejs

base-openjdk: base-openjdk8 base-openjdk11

base-openjdk8: base-openjdk8-jre base-openjdk8-jdk

base-openjdk11: base-openjdk11-jre base-openjdk11-jdk

base-nodejs: base-nodejs10 base-nodejs14

base-openjdk8-jre:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/base/openjdk8-jre:$(tag)-$(release) openjdk8-jre/

base-openjdk8-jdk:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base/openjdk8-jre\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/base/openjdk8-jdk:$(tag)-$(release) openjdk8-jdk/

base-openjdk11-jre:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/base/openjdk11-jre:$(tag)-$(release) openjdk11-jre/

base-openjdk11-jdk:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base/openjdk11-jre\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/base/openjdk11-jdk:$(tag)-$(release) openjdk11-jdk/

base-nodejs10:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/base/nodejs10:$(tag)-$(release) nodejs10/

base-nodejs14:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/base/nodejs14:$(tag)-$(release) nodejs14/

systemd:
	@podman build\
	 --build-arg=registry=$(registry)\
	 --build-arg=repository=$(repository)/base\
	 --build-arg=tag=$(tag)\
	 --build-arg=release=$(release)\
	 --squash\
	 -t $(registry)/$(repository)/systemd:$(tag)-$(release) systemd/

base:
	@podman build\
	 --squash-all\
	 -t $(registry)/$(repository)/base:$(tag)-$(release) base/
