{{- define "telemetry.container" -}}
{{- if .Values.telemetry.enabled }}
- name: fluentbit
  image: public.ecr.aws/ocean-spark/fluent-bit:3.0.5
  securityContext:
    runAsNonRoot: true
  ports:
    - name: http
      containerPort: 2020
      protocol: TCP
  env:
    - name: AWS_BUCKET_NAME
      valueFrom:
        secretKeyRef:
          name: spot-bigdata-telemetry-creds
          key: AWS_BUCKET_NAME
    - name: AWS_REGION
      valueFrom:
        secretKeyRef:
          name: spot-bigdata-telemetry-creds
          key: AWS_REGION
    - name: CLUSTER_ID
      valueFrom:
        configMapKeyRef:
          name: spot-ofas-cluster-info
          key: clusterId
    - name: ACCOUNT_ID
      valueFrom:
        configMapKeyRef:
          name: spot-ofas-cluster-info
          key: accountId
  resources: {}
  volumeMounts:
    - name: telementry-global-config
      mountPath: /opt/bitnami/fluent-bit/conf/fluent-bit.conf
      subPath: fluent-bit.conf
    - name: telementry-custom-config
      mountPath: /opt/bitnami/fluent-bit/conf/custom-filters.conf
      subPath: custom-filters.conf
    - name: telementry-global-config
      mountPath: /opt/bitnami/fluent-bit/conf/parsers.conf
      subPath: parsers.conf
    - name: telementry-custom-config
      mountPath: /opt/bitnami/fluent-bit/conf/metrics-collection.conf
      subPath: metrics-collection.conf
    - name: varlog
      readOnly: true
      mountPath: /var/log/
    - name: varlibdockercontainers
      readOnly: true
      mountPath: /var/lib/docker/containers
    - name: telemetry-aws-credentials
      mountPath: /.aws
{{- end }}
{{- end -}}
