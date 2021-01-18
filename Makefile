include common/args.mk

.PHONY: base base-openjdk8-jre base-openjdk8-jdk base-openjdk11-jre base-openjdk11-jdk base-nodejs10 base-nodejs14 base-python36 base-python38 base-ansible
.PHONY: systemd systemd-openjdk8-jre systemd-openjdk8-jdk systemd-openjdk11-jre systemd-openjdk11-jdk systemd-nodejs10 systemd-nodejs14
.PHONY: systemd-python36 systemd-python38 systemd-ansible systemd-openssh systemd-consul systemd-nginx systemd-minio systemd-nexus

all: base-all systemd-all

systemd-all: systemd-languages systemd-services

systemd-services: systemd-ansible systemd-openssh systemd-consul systemd-nginx systemd-minio systemd-nexus

systemd-nexus: systemd-openjdk8-jre
	@$(MAKE) -C nexus build repository=$(repository_prefix)/systemd/openjdk8-jre repository_prefix=$(repository_prefix)/systemd

systemd-minio: systemd
	@$(MAKE) -C minio build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-nginx: systemd
	@$(MAKE) -C nginx build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-consul: systemd
	@$(MAKE) -C consul build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-openssh: systemd
	@$(MAKE) -C openssh build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-ansible: systemd-python36
	@$(MAKE) -C ansible build repository=$(repository_prefix)/systemd/python36 repository_prefix=$(repository_prefix)/systemd

systemd-languages: systemd-openjdk systemd-nodejs systemd-python

systemd-openjdk: systemd-openjdk8 systemd-openjdk11

systemd-openjdk8: systemd-openjdk8-jre systemd-openjdk8-jdk

systemd-openjdk11: systemd-openjdk11-jre systemd-openjdk11-jdk

systemd-nodejs: systemd-nodejs10 systemd-nodejs14

systemd-python: systemd-python36 systemd-python38

systemd-openjdk8-jre: systemd
	@$(MAKE) -C openjdk8-jre build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-openjdk8-jdk: systemd-openjdk8-jre
	@$(MAKE) -C openjdk8-jdk build repository=$(repository_prefix)/systemd/openjdk8-jre repository_prefix=$(repository_prefix)/systemd

systemd-openjdk11-jre: systemd
	@$(MAKE) -C openjdk11-jre build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-openjdk11-jdk: systemd-openjdk11-jre
	@$(MAKE) -C openjdk11-jdk build repository=$(repository_prefix)/systemd/openjdk11-jre repository_prefix=$(repository_prefix)/systemd

systemd-nodejs10: systemd
	@$(MAKE) -C nodejs10 build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-nodejs14: systemd
	@$(MAKE) -C nodejs14 build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-python36: systemd
	@$(MAKE) -C python36 build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd-python38: systemd
	@$(MAKE) -C python38 build repository=$(repository_prefix)/systemd repository_prefix=$(repository_prefix)/systemd

systemd: base
	@$(MAKE) -C systemd build repository=$(repository_prefix)/base

base-all: base-languages base-services

base-services: base-ansible

base-ansible: base-python36
	@$(MAKE) -C ansible build repository=$(repository_prefix)/base/python36 repository_prefix=$(repository_prefix)/base

base-languages: base-openjdk base-nodejs base-python

base-openjdk: base-openjdk8 base-openjdk11

base-openjdk8: base-openjdk8-jre base-openjdk8-jdk

base-openjdk11: base-openjdk11-jre base-openjdk11-jdk

base-nodejs: base-nodejs10 base-nodejs14

base-python: base-python36 base-python38

base-openjdk8-jre: base
	@$(MAKE) -C openjdk8-jre build repository=$(repository_prefix)/base repository_prefix=$(repository_prefix)/base

base-openjdk8-jdk: base-openjdk8-jre
	@$(MAKE) -C openjdk8-jdk build repository=$(repository_prefix)/base/openjdk8-jre repository_prefix=$(repository_prefix)/base

base-openjdk11-jre: base
	@$(MAKE) -C openjdk11-jre build repository=$(repository_prefix)/base repository_prefix=$(repository_prefix)/base

base-openjdk11-jdk: base-openjdk11-jre
	@$(MAKE) -C openjdk11-jdk build repository=$(repository_prefix)/base/openjdk11-jre repository_prefix=$(repository_prefix)/base

base-nodejs10: base
	@$(MAKE) -C nodejs10 build repository=$(repository_prefix)/base repository_prefix=$(repository_prefix)/base

base-nodejs14: base
	@$(MAKE) -C nodejs14 build repository=$(repository_prefix)/base repository_prefix=$(repository_prefix)/base

base-python36: base
	@$(MAKE) -C python36 build repository=$(repository_prefix)/base repository_prefix=$(repository_prefix)/base

base-python38: base
	@$(MAKE) -C python38 build repository=$(repository_prefix)/base repository_prefix=$(repository_prefix)/base

base:
	@$(MAKE) -C base build repository=$(repository_prefix)
