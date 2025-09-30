image-ghcr:
	docker build --platform linux/amd64 . -t ghcr.io/stackbridge/crypto-market:${v}

push-ghcr:
	docker push ghcr.io/stackbridge/crypto-market:${v}