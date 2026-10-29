# 1) Argo CD itself
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version
  namespace        = "argocd"
  create_namespace = true
  wait             = true
  timeout          = 600

  values = [file("${path.module}/values/argocd.yaml")]
}

# 2) The Argo CD Applications (rendered by the argocd-apps chart).
#    Using a Helm chart instead of kubernetes_manifest avoids needing the
#    Application CRD to exist at plan time.
resource "helm_release" "argocd_apps" {
  name       = "argocd-apps"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = var.argocd_apps_chart_version
  namespace  = "argocd"

  values = [file("${path.module}/values/argocd-apps.yaml")]

  depends_on = [helm_release.argocd]
}
