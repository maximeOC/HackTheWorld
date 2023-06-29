# Variables
COMPOSE_FILE = docker-compose.yaml
PROJECT_NAME = pentest_tool_hwh
SERVICE_NAME = springboot

# Commandes
.PHONY: build up down logs clean

build:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build

up:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d

down:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down

logs:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f $(SERVICE_NAME)

clean:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down --rmi local
