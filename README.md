# tmpl-base

[![CI](https://github.com/selfshop-dev/tmpl-base/actions/workflows/ci.yml/badge.svg)](https://github.com/selfshop-dev/tmpl-base/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/selfshop-dev/tmpl-base/branch/main/graph/badge.svg)](https://codecov.io/gh/selfshop-dev/tmpl-base)
[![Go Report Card](https://goreportcard.com/badge/github.com/selfshop-dev/tmpl-base)](https://goreportcard.com/report/github.com/selfshop-dev/tmpl-base)
[![Go version](https://img.shields.io/github/go-mod/go-version/selfshop-dev/tmpl-base)](go.mod)
[![License](https://img.shields.io/github/license/selfshop-dev/tmpl-base)](LICENSE)

Шаблонный репозиторий для Go-библиотек в организации [selfshop-dev](https://github.com/selfshop-dev).

## Использование шаблона

### 1. Создать репозиторий из шаблона

На GitHub нажмите **Use this template → Create a new repository**.

### 2. Переименовать модуль

Скрипт `rename.sh` заменяет все вхождения `tmpl-base` во всех файлах и именах директорий:

```bash
chmod +x rename.sh
./rename.sh YOUR_NAME
```

Скрипт обрабатывает содержимое файлов (включая `go.mod`, `*.go`, конфиги CI) и переименовывает файлы/директории, чьи имена содержат `tmpl-base`. Каталог `.git` не затрагивается.

### 3. Удалить пример

```bash
rm sum.go sum_test.go
```

### 4. Добавить секреты в репозиторий

| Секрет | Где взять |
|---|---|
| `CODECOV_TOKEN` | [codecov.io](https://codecov.io) → настройки репозитория |

### 5. Обновить этот README

Описать назначение конкретной библиотеки.

## Разработка

```bash
make lint   # golangci-lint run
make test   # go test -race -coverprofile=coverage.out ./...
```

### Ветки

```
main ← только из dev через PR
dev  ← рабочая ветка, PR-ы сюда
```

### Соглашение по коммитам

Проект следует [Conventional Commits](https://www.conventionalcommits.org). Формат: `<type>: <summary>`, где summary — повелительное наклонение, английский язык, без точки в конце.

| Тип | Когда использовать |
|---|---|
| `feat` | Новая функциональность |
| `fix` | Исправление бага |
| `refactor` | Рефакторинг без изменения поведения |
| `perf` | Оптимизация производительности |
| `test` | Добавление или изменение тестов |
| `docs` | Документация |
| `ci` | Изменения CI/CD и GitHub Actions |
| `build` | Сборка, зависимости, инфраструктура проекта |
| `chore` | Рутинные задачи, не попадающие в другие типы |

Тип коммита автоматически определяет метку PR и тип следующего релиза: `feat` → minor, `fix` / `perf` / `refactor` → patch, `feat!` / `fix!` (breaking change) → major.

## CI/CD

```
push / PR → lint → test → codecov
                        → CodeQL (безопасность)
weekly     → Trivy (уязвимости в зависимостях)
merge→main → release-drafter (обновляет черновик релиза)
```

> Покрытие ниже 80 % или падение линтера блокируют merge.

## Лицензия

[MIT](LICENSE) © 2026 selfshop-dev