# syntax=docker/dockerfile:1.3
FROM registry.fedoraproject.org/fedora-minimal:35

ENV HUGO_VERSION 0.91.2

ARG BUILD_DATE
ARG VCS_REF

LABEL description="Docker image for building websites with Hugo static site generator."

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://git.dotya.ml/wanderer/docker-fedora-hugo.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.license=GPL-3.0

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp/hugo.tar.gz

WORKDIR /tmp/
RUN microdnf --refresh upgrade -y && microdnf install -y bsdtar git findutils \
    --nodocs --setopt install_weak_deps=0 \
    && microdnf clean all -y
# ignore DL3059
RUN bsdtar xfv /tmp/hugo.tar.gz && rm -fv /tmp/hugo.tar.gz README.md LICENSE \
    && chmod +x /tmp/hugo \
    && mkdir -pv /usr/local/bin \
    && mv -v /tmp/hugo /usr/local/bin/ \
    && rm -rfv /tmp/* \
    && rm -rf /usr/share/zoneinfo/* ; rm -rf /usr/include/* ; \
    find /. -name "*~" -type f -delete > /dev/null 2>&1 ;\
    find /usr/share/terminfo/. ! -name "*xterm*" ! -name "*screen*" ! -name "*screen*" -type f -delete
WORKDIR /
