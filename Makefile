lint:
	docker run -v $(shell pwd):/mnt -w=/mnt quay.io/helmpack/chart-testing ct lint --config .github/ct-config.yaml
