set dotenv-filename := ".env"
set dotenv-required := true
set dotenv-load := true

default:
    @just --list

changelog:
    git cliff --bump -c docs/cliff.toml > docs/CHANGELOG.md
