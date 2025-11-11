# Gestion des diagrammes

La gestion des diagrammes est assurée via le plugin [MkDocs Kroki Plugin](https://pypi.org/project/mkdocs-kroki-plugin/), qui utilise le serveur Kroki hébergé à l'adresse [https://kroki.tiogars.fr](https://kroki.tiogars.fr).

## Mermaid

```kroki-mermaid
graph TD
    A[Début] --> B[Processus]
    B --> C[Fin]
```

## Gantt avec Mermaid

```kroki-mermaid
gantt
    title A Gantt Diagram
    dateFormat  YYYY-MM-DD
    section Section
    A task           :a1, 2014-01-01, 30d
    Another task     :after a1, 20d
    section Another
    Task in sec      :2014-01-12, 12d
    another task     :24d
```

## Diagrammes réseau avec nwdiag

```kroki-nwdiag
nwdiag {
  network dmz {
    address = "210.x.x.x/24"

    web01 [address = "210.x.x.1"];
    web02 [address = "210.x.x.2"];
  }
  network internal {
    address = "172.x.x.x/24";

    web01 [address = "172.x.x.1"];
    web02 [address = "172.x.x.2"];
    db01;
    db02;
  }
}
```
