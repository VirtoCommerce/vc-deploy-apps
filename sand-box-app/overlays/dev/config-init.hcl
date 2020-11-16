"auto_auth" = {
        "method" = {
            "config" = {
            "role" = "myapp"
            }
            "type" = "kubernetes"
        }

        "sink" = {
            "config" = {
            "path" = "/home/vault/.token"
            }

            "type" = "file"
        }
        }

        "exit_after_auth" = true
        "pid_file" = "/home/vault/.pid"

        "template" = {
        "Contentes" = <<EOF
        {{- with secret "secret/webstore-sso" -}}
        export AzureAd__ApplicationId="{{ .Data.ApplicationID }}"
        {{- end }}
        {{- with secret "secret/webstore-sso" -}}
        export AzureAd__TenantId="{{ .Data.TenantID }}"
        {{- end }}
        EOF
        "destination" = "/vault/secrets/config2"
        }

        "vault" = {
        "address" = "http://vault.hashicorp-vault.svc.cluster.local:8200"
        }