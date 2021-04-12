.PHONY: help

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


udp-local: ## Start a regular UDP socket server & the love frontend
	@docker-compose -f servers/docker-compose-udp-local.yml up --build --force-recreate -d && love udp ; docker-compose -f servers/docker-compose-udp-local.yml down --remove-orphans

udp-local-log: ## Show server-logs for running UDP server
	@docker-compose -f servers/docker-compose-udp-local.yml logs -f --tail=10 --timestamps

udp-web: ## Build & start a full webstack for UDP demo, complete with WASM proxy
	@echo "Server running. Hit http://localhost:8000 to view it.\nPress Ctrl-C to stop it" && docker-compose -f servers/docker-compose-udp-web.yml up --build --force-recreate --remove-orphans

udp-web-log: ## Show server-logs for running UDP server
	@docker-compose -f servers/docker-compose-udp-web.yml logs -f --tail=10 --timestamps


tcp-local: ## Start a regular TCP socket server & the love frontend
	@docker-compose -f servers/docker-compose-tcp-local.yml up --build --force-recreate -d && love tcp ; docker-compose -f servers/docker-compose-tcp-local.yml down --remove-orphans

tcp-local-log: ## Show server-logs for running TCP server
	@docker-compose -f servers/docker-compose-tcp-local.yml logs -f --tail=10 --timestamps

tcp-web: ## Build & start a full webstack for TCP demo, complete with WASM proxy
	@echo "Server running. Hit http://localhost:8000 to view it.\nPress Ctrl-C to stop it" && docker-compose -f servers/docker-compose-tcp-web.yml up --build --force-recreate --remove-orphans

tcp-web-log: ## Show server-logs for running TCP server
	@docker-compose -f servers/docker-compose-tcp-web.yml logs -f --tail=10 --timestamps


ws: ## Start a webscokets server & the love frontend
	@docker-compose -f servers/docker-compose-ws.yml up --build --force-recreate -d && love ws ; docker-compose -f servers/docker-compose-ws-local.yml down --remove-orphans

ws-log: ## Show logs for websockets server
	@docker-compose -f servers/docker-compose-ws.yml logs -f --tail=10 --timestamps