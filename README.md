# mkdocs-docker-image

my default mkdocs docker image to render website docs locally and produce pdf file

## Usage

### Build site and PDF

```bash
docker-compose run --rm mkdocs build
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