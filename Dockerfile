FROM ubuntu:22.04

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update && apt-get -y install --no-install-recommends \
    python3-pip \
    git && \
    apt autoremove && apt clean && rm -rf /var/lib/apt/lists/*
RUN pip install pre-commit

WORKDIR /app
COPY .pre-commit-config.yaml fake_python_module .
RUN git init && git add . && pre-commit run -a && rm -rf /app
