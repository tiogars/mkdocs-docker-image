# Use a slim Python image as base
FROM python:3.14.1-slim

# Install system dependencies required for mkdocs and weasyprint
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libpango-1.0-0 \
        libpangoft2-1.0-0 \
        libharfbuzz-subset0 \
        libjpeg-dev \
        libopenjp2-7-dev \
        libffi-dev \
        unzip \
        udev \
        chromium && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies required for mkdocs and its plugins
RUN pip install --no-cache-dir\
    weasyprint \
    mkdocs \
    mkdocs-material \
    mkdocs-to-pdf \
    mkdocs-include-markdown-plugin \
    mkdocs-macros-plugin \
    mkdocs-mermaid2-plugin \
    mkdocs-kroki-plugin \
    mkdocs-print-site-plugin \
    qrcode \
    mkdocs-static-i18n[material] \
    mkdocs-slides

# Copy the documentation source files into the container
COPY mkdocs.yml server/mkdocs.yml
COPY docs server/docs

WORKDIR /server

# Create the site output folder
RUN mkdir /site_output

# Set mkdocs as the container entrypoint
ENTRYPOINT ["mkdocs"]