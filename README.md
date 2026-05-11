# PokeDex com FastAPI e Docker

Este repositorio contem uma aplicacao FastAPI para gerenciar uma PokeDex, empacotada com Docker e Docker Compose.

## Pre-requisitos

- Docker Desktop instalado
- Docker Compose habilitado no Docker Desktop

## Como executar

1. Clone o repositorio:

```bash
git clone <url-do-repositorio>
cd PokeDex-Docker
```

2. Construa a imagem e suba o container:

```bash
docker compose up --build -d
```

3. Acesse a aplicacao:

- API: http://localhost:8000
- Swagger: http://localhost:8000/docs
- OpenAPI JSON: http://localhost:8000/openapi.json

4. Para ver os logs:

```bash
docker compose logs -f
```

5. Para parar os containers:

```bash
docker compose down
```

## Como testar a API

### 1. Listar pokemons

```bash
curl http://localhost:8000/pokemon/
```

### 2. Cadastrar um pokemon

```bash
curl -X POST http://localhost:8000/pokemon/ \
  -H "Content-Type: application/json" \
  -d "{\"nome\":\"Pikachu\",\"tipo\":\"Eletrico\",\"nivel\":5}"
```

### 3. Atualizar nivel

```bash
curl -X PUT "http://localhost:8000/pokemon/Pikachu/nivel?nivel=10"
```

### 4. Registrar captura

```bash
curl -X POST http://localhost:8000/pokemon/Pikachu/captura \
  -H "Content-Type: application/json" \
  -d "{\"quantidade\":2}"
```

### 5. Ver historico

```bash
curl http://localhost:8000/historico/
```

### 6. Remover pokemon

```bash
curl -X DELETE http://localhost:8000/pokemon/Pikachu
```

## Estrutura do projeto

- `Dockerfile`: constroi a imagem Python com Poetry e dependencias
- `docker-compose.yml`: sobe o servico da aplicacao, portas, volumes e variaveis de ambiente
- `pyproject.toml`: define as dependencias gerenciadas pelo Poetry
- `poetry.lock`: fixa as versoes das dependencias
- `PokeDex/app.py`: codigo fonte da API FastAPI
