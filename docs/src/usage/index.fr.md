# Usage

Pour utiliser cette image Docker afin de construire votre site de documentation MkDocs, vous pouvez exécuter la commande suivante dans votre terminal :

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

Cet exemple suppose que le fichier Compose est à la racine du dépôt. Pour utiliser
la configuration fournie, exécutez `make serve-docker` depuis la racine du dépôt.
