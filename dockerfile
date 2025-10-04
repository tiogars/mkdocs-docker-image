# Use a slim Python image as base
FROM python:3.13.7-slim

# Install system dependencies required for mkdocs and weasyprint
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libpango-1.0-0 \
        libpangoft2-1.0-0 \
        libjpeg-dev \
        libopenjp2-7-dev \
        libffi-dev \
        unzip \
        udev \
        chromium && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies required for mkdocs and its plugins
RUN pip install \
    weasyprint \
    mkdocs \
    mkdocs-material \
    mkdocs-with-pdf \
    mkdocs-include-markdown-plugin \
    mkdocs-macros-plugin \
    mkdocs-mermaid2-plugin \
    mkdocs-kroki-plugin

# Copy the PDF event script into the image and make it executable
COPY ./pdf_event_hook /server/pdf_event_hook
RUN chmod +x /server/pdf_event_hook

# Create the site output folder
RUN mkdir /site_output

# Set mkdocs as the container entrypoint
ENTRYPOINT ["mkdocs"]