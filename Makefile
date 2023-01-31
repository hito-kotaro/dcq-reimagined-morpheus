COMPOSE = docker compose -f ./docker/docker-compose.yml
API_CONTAINER_NAME = morpheus_api
DB_CONTAINER_NAME = morpheus_api
APP_DOCKERFILE = ./docker/Dockerfile
PROFILE = tohi.work-admin
REGION = ap-northeast-1
TASK_DEF_FILE = file://./infrastructure/ecs-task-def.json

.PHONY: up
up:
	$(COMPOSE) up -d

.PHONY: stop
stop:
	$(COMPOSE) stop

.PHONY: restart
restart:
	$(COMPOSE) restrt

.PHONY: down
down:
	$(COMPOSE) down

.PHONY: log
log:
	docker logs $(API_CONTAINER_NAME) -f


push:
	aws ecr get-login-password --profile $(PROFILE) | docker login --username AWS --password-stdin 665378081513.dkr.ecr.ap-northeast-1.amazonaws.com
	docker build -t morpheus-repo -f $(APP_DOCKERFILE) .
	docker tag morpheus-repo:latest 665378081513.dkr.ecr.ap-northeast-1.amazonaws.com/morpheus-repo:latest
	docker push 665378081513.dkr.ecr.ap-northeast-1.amazonaws.com/morpheus-repo:latest