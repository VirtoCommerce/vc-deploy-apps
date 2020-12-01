{{- define "platform.host" -}}
{{- printf "%s-%s.%s.govirto.com" .Release.Name .Values.platform.service.name .Release.Namespace }}
{{- end -}}
{{- define "storefront.host" -}}
{{- printf "%s-%s.%s.govirto.com" .Release.Name .Values.storefront.service.name .Release.Namespace }}
{{- end -}}