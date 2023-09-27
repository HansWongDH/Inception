
NAME = ft_inception

SRC_DIR = srcs/

SRC_FILE = $(SRC_DIR)docker-compose.yml

DOCKER_COMPOSE = docker-compose

BUILD_FLAG = build

UP_FLAG = up -d

DOWN_FLAG = down --rmi all --remove-orphans

PRUNE_FLAG = down --rmi all --remove-orphans --volumes

all: build

build:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(BUILD_FLAG)

up:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(UP_FLAG)

down:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(DOWN_FLAG)

clean: down

fclean: down
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(PRUNE_FLAG)
	rm -rf $(SRC_DIR)home