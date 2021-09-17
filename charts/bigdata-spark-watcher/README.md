# Big Data Spark Watcher

Helm chart to deploy the Big Data Spark Watcher

## Requirements

* prior installation of the sparkoperator.k8s.io/v1beta2 custom resource definitions

## Values

* deploymentLabel: label key used to select sparkApplication custom resources, for instance "wave.spot.io/operator-wave-v0.0.1" (label value is unimportant)

## Installation

1. Add the chart repository:

```sh
$ helm repo add spot https://charts.spot.io
```

2. Update information of available charts:

```sh
$ helm repo update
```

3. Install the Big Data Spark Watcher:

```sh
$ helm install bigdata-spark-watcher spot/bigdata-spark-watcher
```
