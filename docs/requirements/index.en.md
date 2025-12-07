# Dependencies

Here are the dependencies required to build the documentation site.
Python packages are installed via pip.
System packages must be installed separately with Dockerfile.

- [mkdocs](https://www.mkdocs.org)

    - python
    - pip

- [mkdocs-to-pdf](https://mkdocs-to-pdf.readthedocs.io/en/stable/)

    - [weasyprint](https://doc.courtbouillon.org/weasyprint/stable/index.html)

        - libpango-1.0-0
        - libpangoft2-1.0-0
        - libharfbuzz-subset0
        - libjpeg-dev
        - libopenjp2-7-dev
        - libffi-dev
