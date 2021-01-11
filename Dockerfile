FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-l", "-euxo", "pipefail", "-c"]

RUN apt-get update; \
    apt-get full-upgrade -y; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        curl \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm

RUN mkdir -p "$NVM_DIR"; \
    curl -o- \
        "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | \
        bash \
    ; \
    source $NVM_DIR/nvm.sh; \
    nvm install 12.14.1 \
    nvm use 12.14.1

RUN command -v nvm; \
    command -v node; \
    node --version; \
    command -v npm; \
    npm --version \
    npm install --save gitsz \
    npx yarn add @fdsl/gsys
