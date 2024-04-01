.PHONY: all clean_firmware clean_image clean

all:
	docker build --tag zmk_corax54 --file Dockerfile .
	docker run --rm -it --name zmk_corax54 \
		-v $(PWD)/firmware:/app/firmware \
		-v $(PWD)/config:/app/config:ro \
		zmk_corax54

clean_firmware:
	rm -f firmware/*.uf2

clean_image:
	docker image rm zmk_corax54 docker.io/zmkfirmware/zmk-build-arm:stable

clean:
	clean_firmware
	clean_image
