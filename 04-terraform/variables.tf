variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "kubeconfig context of the k3d cluster"
  type        = string
  default     = "k3d-devops-lab"
}

variable "argocd_chart_version" {
  description = "Version of the argo/argo-cd Helm chart"
  type        = string
  default     = "10.11.6"
}

variable "argocd_apps_chart_version" {
  description = "Version of the argo/argocd-apps Helm chart"
  type        = string
  default     = "2.0.7"
}
