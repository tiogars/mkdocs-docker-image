.DEFAULT_GOAL := help

COMPOSE ?= docker compose
COMPOSE_DEV ?= docs/docker/docker-compose.yml
COMPOSE_LOCAL ?= docs/docker/docker-compose-dev.yml
MKDOCS_CONFIG ?= docs/mkdocs/mkdocs.yml
export MKDOCS_CONFIG
PYTHON ?= python

.PHONY: help build serve serve-docker serve-docker-local build-docker build-docker-local clean docker-up-docs docker-down-docs

help:
	@echo "Development targets (site available at http://localhost:8000):"
	@echo "  make serve              Serve with MkDocs installed on the host"
	@echo "  make serve-docker       Serve with the published Docker image"
	@echo "  make serve-docker-local Build the local image and serve with Docker"
	@echo "  make build              Build the site with MkDocs on the host"
	@echo "  make build-docker       Build the site with the published Docker image"
	@echo "  make build-docker-local Build the site with the local Docker image"
	@echo "  make clean              Remove generated site output"
	@echo "  make docker-up-docs     Start the local Docker site in the background"
	@echo "  make docker-down-docs   Stop the local Docker site"

build:
	mkdocs build --config-file $(MKDOCS_CONFIG)

serve:
	mkdocs serve --config-file $(MKDOCS_CONFIG) --dev-addr=127.0.0.1:8000

serve-docker:
	$(COMPOSE) -f $(COMPOSE_DEV) up mkdocs

serve-docker-local:
	$(COMPOSE) -f $(COMPOSE_LOCAL) up --build docs

build-docker:
	$(COMPOSE) -f $(COMPOSE_DEV) run --rm mkdocs build --config-file $(MKDOCS_CONFIG)

build-docker-local:
	$(COMPOSE) -f $(COMPOSE_LOCAL) run --build --rm docs build --config-file $(MKDOCS_CONFIG)

clean:
	$(PYTHON) -c "from pathlib import Path; import shutil; p = Path('site_output'); shutil.rmtree(p) if p.exists() else None"

docker-up-docs:
	$(COMPOSE) -f $(COMPOSE_LOCAL) up --build --force-recreate -d docs

docker-down-docs:
	$(COMPOSE) -f $(COMPOSE_LOCAL) down
