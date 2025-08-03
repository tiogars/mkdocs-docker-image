FROM python:3.12.1-slim

RUN apt update && \
    apt install -yq libpango-1.0-0 libpangoft2-1.0-0 libjpeg-dev libopenjp2-7-dev libffi-dev unzip && \
    apt clean

RUN apt-get update && apt-get install -y udev chromium

RUN pip install weasyprint

RUN pip install mkdocs

RUN pip install mkdocs-material

RUN pip install mkdocs-with-pdf

RUN pip install mkdocs-include-markdown-plugin

RUN pip install mkdocs-macros-plugin

RUN pip install mkdocs-mermaid2-plugin

RUN pip install mkdocs-kroki-plugin

ENTRYPOINT ["mkdocs"]