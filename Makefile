help: ## Display this help screen
	@grep -h \
		-E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

login_db: ## login db
	@psql -h localhost -U postgres

start: ## start
	@docker compose up -d

start_pgadmin: ## start pgadmin
	@docker compose up -d pgadmin

clear: ## reset
	@docker compose down --volumes

.PHONY: clippy fmt test
