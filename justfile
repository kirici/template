set dotenv-filename := ".env"
set dotenv-required := true
set dotenv-load := true

default:
    @just --list

up:
    podman compose up -d

down:
    podman compose down

changelog:
    git cliff --bump -c docs/cliff.toml > docs/CHANGELOG.md
