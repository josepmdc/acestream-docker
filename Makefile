NAME ?= acestream

build:
	docker build -t $(NAME) .

run:
	docker run -p 6878:6878 -d --name=$(NAME) --rm $(NAME):latest

stop:
	docker kill $(NAME)

status:
	docker ps -f name=$(NAME)

logs:
	docker logs $(NAME)
