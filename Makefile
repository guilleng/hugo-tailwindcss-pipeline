current_dir = $(shell pwd)

.PHONY: code
code:
	@podman run -it --rm \
	-v $(current_dir)/hugo-tailwindcss-site:/src:Z \
	-p 8080:8080 \
	hugo-tailwindcss:latest /bin/bash -c "echo 'Install dependencies: npm i'; echo 'Run the dev server: npm run dev'; /bin/bash"

.PHONY: build
build:
	@podman run --rm \
	-v $(current_dir)/hugo-tailwindcss-site:/src:Z \
	hugo-tailwindcss:latest /bin/bash -c "cd /src; npm i && npm run build"
