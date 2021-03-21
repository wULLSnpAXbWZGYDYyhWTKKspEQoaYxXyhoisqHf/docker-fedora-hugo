FROM fedora:33

ENV HUGO_VERSION 0.82.0

ARG BUILD_DATE
ARG VCS_REF

LABEL description="Docker image for building websites with Hugo static site generator."

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://git.dotya.ml/wanderer/docker-archlinux-hugo.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.license=GPL-3.0

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp/hugo.tar.gz

WORKDIR /tmp/
RUN dnf --refresh upgrade -y && dnf install -y git findutils
RUN tar xfv /tmp/hugo.tar.gz && rm -v /tmp/hugo.tar.gz README.md LICENSE \
    && chmod +x /tmp/hugo \
    && mkdir -pv /usr/local/bin \
    && mv -v /tmp/hugo /usr/local/bin/ \
    && rm -rv /tmp/*
RUN dnf autoremove -y -x findutils \
    && dnf clean all -y
RUN rm -r /usr/share/zoneinfo/* ; rm -r /usr/include/* ; \
    find /. -name "*~" -type f -delete; \
    find /usr/share/terminfo/. ! -name "*xterm*" ! -name "*screen*" ! -name "*screen*" -type f -delete
WORKDIR /
