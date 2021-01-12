#!/usr/bin/env bash

REGISTRY=registry.skarbek.name
REPOSITORY=ubi8
TAG=2021.01.13
RELEASE=1

podman build\
 --squash-all\
 -t ${REGISTRY}/${REPOSITORY}/base:${TAG}-${RELEASE} base/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd:${TAG}-${RELEASE} systemd/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/openssh:${TAG}-${RELEASE} openssh/

podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/base/openjdk8-jre:${TAG}-${RELEASE} openjdk8-jre/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd/openjdk8-jre:${TAG}-${RELEASE} openjdk8-jre/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base/openjdk8-jre\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/base/openjdk8-jdk:${TAG}-${RELEASE} openjdk8-jdk/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd/openjdk8-jre\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd/openjdk8-jdk:${TAG}-${RELEASE} openjdk8-jdk/

podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/base/openjdk11-jre:${TAG}-${RELEASE} openjdk11-jre/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd/openjdk11-jre:${TAG}-${RELEASE} openjdk11-jre/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base/openjdk11-jre\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/base/openjdk11-jdk:${TAG}-${RELEASE} openjdk11-jdk/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd/openjdk11-jre\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd/openjdk11-jdk:${TAG}-${RELEASE} openjdk11-jdk/

podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/base/nodejs10:${TAG}-${RELEASE} nodejs10/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd/nodejs10:${TAG}-${RELEASE} nodejs10/

podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/base\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/base/nodejs14:${TAG}-${RELEASE} nodejs14/
podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/systemd/nodejs14:${TAG}-${RELEASE} nodejs14/

podman build\
 --build-arg=registry=${REGISTRY}\
 --build-arg=repository=${REPOSITORY}/systemd\
 --build-arg=tag=${TAG}\
 --build-arg=release=${RELEASE}\
 --squash\
 -t ${REGISTRY}/${REPOSITORY}/nginx:${TAG}-${RELEASE} nginx/
