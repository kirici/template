# Repo template

This is a template repo for personal use with things I usually copy around or write anew repeatedly, kept to a minimum.

## Requirements

- Podman, or alternatively Docker
- [mise](https://github.com/jdx/mise), which provides Go and [git-cliff](https://github.com/orhun/git-cliff)

## Usage

Clone and search+replace as necessary, then:

```sh
cp .env.sample .env
mise install
mise run
```

`mise run` without arguments shows a task picker, `mise tasks` lists all tasks.
