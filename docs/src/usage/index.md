# Usage

To use this Docker image to build your MkDocs documentation site, you can run
the following command in your terminal :

## Command

```bash
docker run -v ./docs:/server/docs:ro -v ./site_output:/server/site_output -w /server/ -p 8000:8000 ghcr.io/tiogars/mkdocs-docker-image:latest serve --config-file=docs/mkdocs/mkdocs.yml --dev-addr=0.0.0.0:8000
```

## Docker Compose

```yaml
services:
    mkdocs:
        image: ghcr.io/tiogars/mkdocs-docker-image:latest
        volumes:
            - ./docs:/server/docs:ro
            - ./site_output:/server/site_output
        working_dir: /server/
        command: ["serve", "--config-file=docs/mkdocs/mkdocs.yml", "--dev-addr=0.0.0.0:8000"]
        ports:
            - "8000:8000"
```

This example assumes the Compose file is at the repository root. To use the
provided configuration, run `make serve-docker` from the repository root.
