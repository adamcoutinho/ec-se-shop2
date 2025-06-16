install:
	docker compose up -d
reverse-proxy:
	docker compose up -d reverse-proxy
dns-local:
	docker compose up -d whoami
test:
	curl -H Host:whoami.docker.localhost http://127.0.0.1