{{/*
In the `templates/` directory, any file that begin with an _ is not expected to
output a k8s manifest file.
By convention, macro are placed in a `_helpers.tpl` file

Instructures:
1. define: create a named macro
   eg: {{- define "mychart.labels" }}
2. template: use a named macro (inline expand). When a named macro is rendered, it will receive
   the scope passed in by `template` call.
   format: template macro-name <scope> (scope is optional)
   eg: {{- template "mychart.labels" }}
       {{- template "mychart.labels" . }}  pass top-level scope in macro
3. include: an alternative to `template`, which can do more thing. `include` support pipeline to
            control format.
   eg: {{- include "mychart.labels" . | nindent 4 }}

Notes:
1. Macro name are ***global*** (macro in subcharts are compiled together with top-level template macro).
2. Best practice of macro name, prefix each defined macro with the name of the chart.
   eg: {{ define "lnmp" }}
*/}}

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "lnmp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lnmp.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lnmp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "lnmp.labels" -}}
app.kubernetes.io/name: {{ include "lnmp.name" . }}
helm.sh/chart: {{ include "lnmp.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
