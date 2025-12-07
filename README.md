# mkdocs-docker-image

my default mkdocs docker image to render website docs locally and produce pdf file

[![Build and Publish Docker Image](https://github.com/tiogars/mkdocs-docker-image/actions/workflows/docker-image.yml/badge.svg)](https://github.com/tiogars/mkdocs-docker-image/pkgs/container/mkdocs-docker-image)
[![Deploy Documentation](https://github.com/tiogars/mkdocs-docker-image/actions/workflows/deploy-docs.yml/badge.svg)](https://tiogars.github.io/mkdocs-docker-image/)
[![Dependabot Updates](https://github.com/tiogars/mkdocs-docker-image/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/tiogars/mkdocs-docker-image/pulls)

## Usage

### Build site and PDF

```bash
docker-compose run --rm mkdocs build
```

```bash
docker run -v ./docs:/server/docs -v ./mkdocs.yml:/server/mkdocs.yml -v ./site_output:/server/site_output -w /server/ -p 8000:8000 ghcr.io/tiogars/mkdocs-docker-image:latest build
```

### Development server

#### Start server

```bash
docker-compose up mkdocs
```

#### Build site

```bash
docker-compose -f docker-compose-dev.yml run --rm mkdocs build
```
