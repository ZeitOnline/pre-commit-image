# Container image for running pre-commit

Inspired by https://gitea.zionetrix.net/bn8/docker-python-pre-commit

Example usage:

```yaml
name: pre-commit

on:
  push:
    branches:
    - main
  pull_request:

jobs:
  pre-commit:
    runs-on: [self-hosted, x64, linux, ephemeral, zon-image-latest]
    permissions:
      contents: read

    container:
      image: ghcr.io/zeitonline/pre-commit-image:1.0

    steps:
    - uses: actions/checkout@v3
    - uses: pre-commit/action@v3.0.0
```
