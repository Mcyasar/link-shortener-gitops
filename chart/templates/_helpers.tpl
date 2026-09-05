{{/* Name of the chart */}}
{{- define "linkshortener.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Fullname definition */}}
{{- define "linkshortener.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Dynamic env definition */}}
{{- define "linkshortener.env" -}}
{{- if eq .Values.environment eq "dev" -}}
{{- "development" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Values.environment | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Common Labels */}}
{{- define "linkshortener.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "linkshortener.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/environment: {{ .Values.environment }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}