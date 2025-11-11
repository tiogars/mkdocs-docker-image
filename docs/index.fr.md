# mkdocs-docker-image

## Objectif

Ce dépôt a pour but de fournir une image Docker pour générer un site web à l'aide du framework MkDocs avec des plugins utiles préinstallés, facilitant ainsi la création et la gestion de documentation technique.

- [Fonctionnalités](features/index.fr.md)
- [Gestion des diagrammes](diagrams/index.fr.md)

## Aller plus loin

- [Catalogue des plugins MkDocs](https://github.com/mkdocs/catalog)

## Problèmes connus

- Le pdf généré pour chaque langue écrase le pdf précédent.
- Le plugin "mkdocs-static-i18n" n'est pas encore totalement compatible avec "mkdocs-to-pdf". [Voir l'issue #329](https://github.com/ultrabug/mkdocs-static-i18n/issues/329) pour plus de détails.
