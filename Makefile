.PHONY: help
help:
	@awk 'BEGIN { in_section=0 } \
		/^# ===/ { \
			gsub(/# === | ===/, ""); \
			printf "\n\033[1m%s:\033[0m\n", $$0; \
			in_section=1 \
		} \
		/^[a-zA-Z_-]+:.*##/ { \
			if (in_section) { \
				split($$0, parts, ":.*?## "); \
				printf "  \033[36m%-20s\033[0m %s\n", parts[1], parts[2] \
			} \
		}' $(MAKEFILE_LIST)
	@echo ""

.DEFAULT_GOAL := help

# === CI/CD ===

.PHONY: lint
lint: ## Запустить линтер
	golangci-lint run

.PHONY: test
test: ## Запустить тесты с покрытием
	go test -race -coverprofile=coverage.out -covermode=atomic ./...
	sed -i '/_mock\.go:/d' coverage.out || true
	go tool cover -func=coverage.out | tee coverage.humanize | tail -1