
NAME = ft_inception

SRC_DIR = srcs/

MKDIR = mkdir -p

MDB_VOLUME_DIR	= $(HOME)/data/mariadb
WP_VOLUME_DIR	= $(HOME)/data/wordpress

SRC_FILE = $(SRC_DIR)docker-compose.yml

DOCKER_COMPOSE = docker-compose

BUILD_FLAG = build

UP_FLAG = up

DOWN_FLAG = down --rmi all --remove-orphans

PRUNE_FLAG = down --rmi all --remove-orphans --volumes

all: build up

build:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(BUILD_FLAG)
	$(MKDIR) $(MDB_VOLUME_DIR) $(WP_VOLUME_DIR)

up:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(UP_FLAG)

down:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(DOWN_FLAG)

clean: down

fclean:
	$(DOCKER_COMPOSE) -f $(SRC_FILE) $(PRUNE_FLAG)
	rm -rf $(MDB_VOLUME_DIR) $(WP_VOLUME_DIR)