lint:
	docker run -v $(shell pwd):/mnt -w=/mnt quay.io/helmpack/chart-testing ct lint --config .github/ct-config.yaml

spark-operator-v2:
	curl -L -O https://github.com/spotinst/spark-on-k8s-operator/archive/ocean-spark-v2.zip
	unzip ocean-spark-v2.zip
	rm ocean-spark-v2.zip
	rm -rf ./charts/spark-operator-v2/charts/spark-operator
	mv ./spark-on-k8s-operator-ocean-spark-v2/charts/spark-operator-chart ./charts/spark-operator-v2/charts/spark-operator
	rm -rf spark-on-k8s-operator-ocean-spark-v2
	cp -r ./charts/spark-operator-v2/charts/spark-operator/crds ./charts/bigdata-crds