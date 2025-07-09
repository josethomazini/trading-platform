.PHONY: help up down bash test, unit_test

help: ## Show this help
	@echo -e "\n\033[1mComandos disponíveis:\033[0m\n"
	@grep -E '^([a-zA-Z0-9_-]+):.*?## .+$$' $(MAKEFILE_LIST) | \
	sort | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

up: ## Run composer as a daemon
	docker compose --env-file .env.dev -f docker/docker-compose-dev.yml up -d --build

down: ## Turn down compose
	docker compose --env-file .env.dev -f docker/docker-compose-dev.yml down

bash: ## Access bash from backend container
	docker compose --env-file .env.dev -f docker/docker-compose-dev.yml exec -it backend bash

unit_test: ## Run unit tests only
	docker compose --env-file .env.dev -f docker/docker-compose-dev.yml exec backend bash -c "npm run test:unit"

test: ## Run tests
	docker compose --env-file .env.dev -f docker/docker-compose-dev.yml exec backend bash -c "npm run test"
