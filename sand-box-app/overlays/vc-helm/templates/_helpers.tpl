{{- define "env.naming" -}}
{{- $name := trimSuffix .Release.Namespace .Release.Name | trimSuffix "-" -}}
{{- printf $name }}
{{- end -}}
{{- define "platform.host" -}}
{{- $name := trimSuffix .Release.Namespace .Release.Name | trimSuffix "-" -}}
{{- printf "%s-%s.%s.govirto.com" $name .Values.platform.service.name .Release.Namespace }}
{{- end -}}
{{- define "storefront.host" -}}
{{- $name := trimSuffix .Release.Namespace .Release.Name | trimSuffix "-" -}}
{{- printf "%s-%s.%s.govirto.com" $name .Values.storefront.service.name .Release.Namespace }}
{{- end -}}