# desafio-go

Desafio do curso **Full Cycle**: criar a menor imagem Docker possível para um programa em Go que imprime `Full Cycle Rocks!!`.

## Como foi feito

O [`Dockerfile`](Dockerfile) usa **multi-stage build**:

1. O estágio `builder` (`golang:alpine`) compila o binário estático, com `CGO_ENABLED=0` e as flags `-s -w`, que removem informações de debug.
2. O estágio final parte de `scratch`, uma imagem vazia, e copia só o binário.

O resultado é uma imagem com pouco mais que o próprio executável.

## Como rodar

```bash
docker run --rm victorhermon/desafio-go
# ou, a partir do código
docker compose up --build
```

## Imagem no Docker Hub

https://hub.docker.com/r/victorhermon/desafio-go

## Tecnologias

Go · Docker (multi-stage build) · Docker Compose
