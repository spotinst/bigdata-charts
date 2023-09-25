{{/*
{{/*
Expand the name of the chart.
*/}}
{{- define "bigdata-notebook-workspace.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bigdata-notebook-workspace.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bigdata-notebook-workspace.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bigdata-notebook-workspace.labels" -}}
helm.sh/chart: {{ include "bigdata-notebook-workspace.chart" . }}
{{ include "bigdata-notebook-workspace.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
bigdata.spot.io/component: bigdata-notebook-workspace
bigdata.spot.io/creatorUserId: {{ .Values.creatorUserId | quote }}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "bigdata-notebook-workspace.annotations" -}}
bigdata.spot.io/notebookWorkspaceName: {{ .Values.workspaceName }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bigdata-notebook-workspace.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bigdata-notebook-workspace.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "bigdata-notebook-workspace.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "bigdata-notebook-workspace.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
