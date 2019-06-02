.PHONY: help up down logs

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Run service. Usage: make up [service]. Available services: mariadb, redis, mongo, minio, mailcatcher
	@docker-compose -f $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS)).yml up -d

down: ## Down the service. Usage: make down [service]. Available services: mariadb, redis, mongo, minio, mailcatcher
	@docker-compose -f $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS)).yml down -v --rmi=local

logs: ## Show logs. Usage: make logs [service]. Available services: mariadb, redis, mongo, minio, mailcatcher
	@docker-compose -f $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS)).yml logs

%:
	@: