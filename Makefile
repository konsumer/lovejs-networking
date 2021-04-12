.PHONY: help

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

udp-local: ## Start a regular UDP socket server & the love frontend
	@docker-compose -f servers/docker-compose-udp-local.yml up -d && love udp ; docker-compose -f servers/docker-compose-udp-local.yml down ; docker-compose -f servers/docker-compose-udp-local.yml logs

udp-web: ## Build & start a full webstack for UDP demo, complete with WASM proxy
	@echo "Server running. Hit http://localhost:8000 to view it.\nPress Ctrl-C to stop it" && docker-compose -f servers/docker-compose-udp-web.yml up --build --force-recreate
