# Iceberg - StarRocks Lakehouse Environment

BOLD   := \033[1m
GREEN  := \033[32m
YELLOW := \033[33m
BLUE   := \033[34m
CYAN   := \033[36m
RED    := \033[31m
RESET  := \033[0m

.PHONY: help setup down restart destroy logs ps starrocks urls

help:
	@echo "$(BOLD)$(CYAN)Iceberg - StarRocks Lakehouse Environment$(RESET)"
	@echo ""
	@echo "$(BOLD)Infrastructure Commands$(RESET)"
	@echo "  $(YELLOW)setup$(RESET)      Start all services and wait for readiness"
	@echo "  $(YELLOW)down$(RESET)       Stop all running services"
	@echo "  $(YELLOW)restart$(RESET)    Restart the entire environment"
	@echo "  $(YELLOW)destroy$(RESET)    Remove containers, networks, and volumes"
	@echo "  $(YELLOW)logs$(RESET)       Stream service logs"
	@echo "  $(YELLOW)ps$(RESET)         Display container status"
	@echo ""
	@echo "$(BOLD)Database Access$(RESET)"
	@echo "  $(YELLOW)starrocks$(RESET)  Open a StarRocks SQL shell"
	@echo ""
	@echo "$(BOLD)Utilities$(RESET)"
	@echo "  $(YELLOW)urls$(RESET)       Display service endpoints"
	@echo ""

setup:
	@echo "$(CYAN)Starting Lakehouse services...$(RESET)"
	@docker compose up -d --wait --wait-timeout 400
	@echo "$(GREEN) All services are healthy and ready.$(RESET)"

down:
	@echo "$(YELLOW)Stopping services...$(RESET)"
	@docker compose down

restart: down setup

destroy:
	@echo "$(RED)Removing containers, networks, and volumes...$(RESET)"
	@docker compose down -v --remove-orphans
	@echo "$(GREEN) Environment successfully removed.$(RESET)"

logs:
	@docker compose logs -f

ps:
	@echo "$(CYAN)Current service status$(RESET)"
	@docker compose ps

starrocks:
	@docker exec -it starrocks-fe \
	mysql -h 127.0.0.1 -P 9030 -u root \
	--prompt="StarRocks > "

urls:
	@echo "$(BOLD)$(BLUE)Service Endpoints$(RESET)"
	@echo ""
	@echo "  StarRocks UI    : http://localhost:8030"
	@echo "  MinIO Console   : http://localhost:9001"
	@echo "  Iceberg REST    : http://localhost:8181"
	@echo ""