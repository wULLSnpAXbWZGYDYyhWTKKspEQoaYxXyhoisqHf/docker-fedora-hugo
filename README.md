# docker-fedora-hugo

[![Build Status](https://drone.dotya.ml/api/badges/wanderer/docker-fedora-hugo/status.svg)](https://drone.dotya.ml/wanderer/docker-fedora-hugo)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/immawanderer/fedora-hugo)](https://hub.docker.com/r/immawanderer/fedora-hugo/builds)
[![](https://images.microbadger.com/badges/version/immawanderer/archlinux.svg)](https://microbadger.com/images/immawanderer/fedora-hugo)
[![](https://images.microbadger.com/badges/commit/immawanderer/archlinux.svg)](https://microbadger.com/images/immawanderer/fedora-hugo)

This repository provides the Dockerfile to create a Docker image used for web developent using [Hugo](https://gohugo.io) website building framework.

The image is rebuilt <del>approximately every hour</del> nightly to ensure it always has the latest packages.

push mirror lives in [this GitHub repo](https://github.com/wULLSnpAXbWZGYDYyhWTKKspEQoaYxXyhoisqHf/docker-fedora-hugo)  
development happens on [this Gitea instance](https://git.dotya.ml/wanderer/docker-fedora-hugo)

## What you get
* updated `registry.fedoraproject.org/fedora-minimal:34` image
* git
* hugo-extended (latest version from [GitHub](https://github.com/gohugoio/hugo/releases))

## Purpose
* web development using `Hugo` upon fresh package base
