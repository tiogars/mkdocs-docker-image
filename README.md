# mkdocs-docker-image

my default mkdocs docker image to render website docs locally and produce pdf file

[![Build and Publish Docker Image](https://github.com/tiogars/mkdocs-docker-image/actions/workflows/docker-image.yml/badge.svg)](https://github.com/tiogars/mkdocs-docker-image/pkgs/container/mkdocs-docker-image)
[![Deploy Documentation](https://github.com/tiogars/mkdocs-docker-image/actions/workflows/deploy-docs.yml/badge.svg)](https://tiogars.github.io/mkdocs-docker-image/)
[![Dependabot Updates](https://github.com/tiogars/mkdocs-docker-image/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/tiogars/mkdocs-docker-image/pulls)

## Usage

Run commands from the repository root. Documentation sources are in `docs/src`,
MkDocs configuration, assets and templates in `docs/mkdocs`, and Docker
configuration in `docs/docker`. Generated HTML and PDFs are in `site_output`.
The MkDocs hook publishes `docs/mkdocs/assets` with the documentation and resolves
custom PDF templates and the cover logo relative to the selected configuration
file.

### Build site and PDF

```bash
make build-docker
```

```bash
docker compose -f docs/docker/docker-compose.yml run --rm mkdocs build --config-file docs/mkdocs/mkdocs.yml
```

### Development server

#### Start server

```bash
make serve-docker
```

#### Build site

```bash
make build-docker-local
```

Use `make serve-docker-local` to build and serve the local image, or `make serve`
and `make build` when MkDocs and its plugins are installed on the host.
For the alternate configuration, run
`make build-docker-local MKDOCS_CONFIG=docs/mkdocs/mkdocs-i18n.yml`
to ensure all plugins are available.
