FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    POETRY_VERSION=1.8.3 \
    POETRY_HOME=/opt/poetry \
    POETRY_VIRTUALENVS_CREATE=false \
    PATH="/opt/poetry/bin:$PATH"

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app

COPY pyproject.toml poetry.lock* ./

RUN poetry install --only main --no-root --no-interaction --no-ansi

COPY PokeDex/ ./PokeDex/

EXPOSE 8000

CMD ["uvicorn", "PokeDex.app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
