# docker-fedora-hugo

[![Build Status](https://drone.dotya.ml/api/badges/wanderer/docker-fedora-hugo/status.svg)](https://drone.dotya.ml/wanderer/docker-fedora-hugo)
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/immawanderer/fedora-hugo)](https://hub.docker.com/r/immawanderer/fedora-hugo/tags/?page=1&ordering=last_updated)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/immawanderer/fedora-hugo/linux-amd64)](https://hub.docker.com/r/immawanderer/fedora-hugo/tags/?page=1&ordering=last_updated&name=linux-amd64)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/immawanderer/fedora-hugo/linux-amd64)](https://hub.docker.com/r/immawanderer/fedora-hugo/tags/?page=1&ordering=last_updated&name=linux-amd64)
[![Docker pulls](https://img.shields.io/docker/pulls/immawanderer/fedora-hugo)](https://hub.docker.com/r/immawanderer/fedora-hugo/)

This repository provides a Containerfile to create a container image, which may be used for web developent using [Hugo](https://gohugo.io) website building framework.

The image is rebuilt <del>approximately every hour</del> nightly to ensure it always has the latest packages.

push mirror lives in [this GitHub repo](https://github.com/wULLSnpAXbWZGYDYyhWTKKspEQoaYxXyhoisqHf/docker-fedora-hugo)  
development happens on [this Gitea instance](https://git.dotya.ml/wanderer/docker-fedora-hugo)

## What you get
* updated `registry.fedoraproject.org/fedora-minimal:36` image
* git
* hugo-extended (latest version from [GitHub](https://github.com/gohugoio/hugo/releases))

## Purpose
* web development using `Hugo` upon fresh package base
