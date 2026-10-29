output "argocd_url" {
  value = "http://argocd.localhost:8080"
}

output "grafana_url" {
  value = "http://grafana.localhost:8080"
}

output "argocd_admin_password_command" {
  description = "PowerShell command that prints the initial Argo CD admin password"
  value       = "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\")))"
}
