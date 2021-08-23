build:
	docker build -t sheepdoge/pup-r .

test: build
	docker run sheepdoge/pup-r

interactive: build
	docker run -it sheepdoge/pup-r /bin/bash
