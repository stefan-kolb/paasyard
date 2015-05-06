build:
 	# create image
	cp -f docker/base.docker Dockerfile
	docker build -t="stfnklb/yard:base" .
	# clean
	rm Dockerfile

install: build
	# install executable
	chmod +x paasyard
	cp paasyard /usr/local/bin/
	@echo
	@echo "Your PaaSyard is ready. Let's get to work!"

.PHONY: build install

