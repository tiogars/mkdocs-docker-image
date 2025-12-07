# Usage

To use this Docker image to build your MkDocs documentation site, you can run
the following command in your terminal :

## Command

```bash
docker run -v ./docs:/server/docs -v ./mkdocs.yml:/server/mkdocs.yml -v ./site_output:/server/site_output -w /server/ -p 8000:8000 ghcr.io/tiogars/mkdocs-docker-image:latest serve --dev-addr=0.0.0.0:8000
```

## Docker Compose

```yaml
services:
  mkdocs:
    image: ghcr.io/tiogars/mkdocs-docker-image:latest
    volumes:
      - ./docs:/server/docs
      - ./mkdocs.yml:/server/mkdocs.yml
      - ./site_output:/server/site_output
    working_dir: /server/
    command: ["serve","--dev-addr=0.0.0.0:8000"]
    ports:
      - "8000:8000"
```
