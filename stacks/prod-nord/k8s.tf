resource "kubernetes_namespace" "this" {
  for_each = toset(["cert-manager", "erp", "ingress", "monitoring", "shop"])

  metadata {
    name = each.key
  }
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.11.3"
  namespace  = kubernetes_namespace.this["ingress"].metadata[0].name
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  chart      = "cert-manager"
  repository = "https://charts.jetstack.io"
  version    = "1.16.1"
  namespace  = kubernetes_namespace.this["cert-manager"].metadata[0].name
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "65.1.0"
  namespace  = kubernetes_namespace.this["monitoring"].metadata[0].name
}

resource "helm_release" "shop_frontend" {
  name      = "shop-frontend"
  chart     = "oci://registry.example.com/charts/shop-frontend"
  version   = "2.8.0"
  namespace = kubernetes_namespace.this["shop"].metadata[0].name
}

resource "helm_release" "shop_api" {
  name      = "shop-api"
  chart     = "oci://registry.example.com/charts/shop-api"
  version   = "2.8.0"
  namespace = kubernetes_namespace.this["shop"].metadata[0].name
}

resource "helm_release" "erp_api" {
  name      = "erp-api"
  chart     = "oci://registry.example.com/charts/erp-api"
  version   = "1.3.2"
  namespace = kubernetes_namespace.this["erp"].metadata[0].name
}
