FROM debian:bookworm-slim

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

ARG HUGO_VERSION=0.127.0
ARG HUGO_EXTENDED=true
RUN ARCH=$(dpkg --print-architecture) && \
    curl -sSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_EXTENDED:+extended_}${HUGO_VERSION}_linux-${ARCH}.deb" -o /tmp/hugo.deb && \
    curl -sSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_checksums.txt" -o /tmp/hugo-checksums.txt && \
    grep -q $(sha256sum /tmp/hugo.deb | awk '{print $1}') /tmp/hugo-checksums.txt && \
    apt-get update && \
    apt-get install -y /tmp/hugo.deb && \
    rm /tmp/hugo.deb /tmp/hugo-checksums.txt \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src
COPY hugo-tailwindcss-site /src
