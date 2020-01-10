variable "CREATOR" {
  type        = string
  description = "Creator of this deployment"
}

variable "LOCATION" {
  type        = string
  description = "Azur region to deploy resources to"
  default     = "<%= location %>"
}

variable "AKS_MANAGED_RESOURCE_GROUP" {
  type        = string
  description = "The name of the Kubernetes managed resource group to create cluster-related infrastructure"
}

variable "APP_NAME" {
  type        = string
  description = "Application name"
  default     = "<%= name %>"
}

variable "HELM_RECREATE_PODS" {
  type        = string
  description = "Recreate pods after deploying?"
  default     = "true"
}

variable "DOCKER_REPO_SERVER" {
  type        = string
  description = "Docker private repository hostname"
  default     = null
}

variable "DOCKER_REPO_USERNAME" {
  type        = string
  description = "Docker repository username"
  default     = null
}

variable "DOCKER_REPO_PASSWORD" {
  type        = string
  description = "Docker repository password"
  default     = null
}

variable "DOCKER_REPO_EMAIL" {
  type        = string
  description = "Docker repository email"
  default     = null
}

variable "DOCKER_SECRET_NAME" {
  type        = string
  description = "Docker repository secret name"
  default     = null
}

variable "INGRESS_ENABLED" {
  type        = bool
  description = "(Optional) Creates an nginx-ingress for this application. Defaults to true"
  default     = true
}

variable "INGRESS_HOSTNAME" {
  type = string
  description = "(Optional) When DNS Zone is disabled, use this variable to add a hostname to the ingress. This property is ignored if the DNS Zone is enabled"
  default = null
}


variable "INGRESS_CHART" {
  type        = string
  description = "Ingress Helm chart name or folder"
  default     = "<%= ingressChart %>"
}

variable "INGRESS_CHART_VERSION" {
  type        = string
  description = "Ingress Helm chart version"
  default     = "<%= ingressChartVersion %>"
}

variable "INGRESS_SERVICE_SUBNET" {
  type        = string
  description = "(Optional) When deploying internal ingresses, this variable allows you to allocate a load balancer in an specific VNET subnet"
  default     = null
}

variable "INGRESS_IP" {
  type = string
  description = "(Optional) When Ingress is internal, use this variable to specify the Ingress private IP address. This IP should belog to to the INGRESS_SERVICE_SUBNET VNET subnet"
  default = null
}

variable "INGRESS_REPLICAS" {
  type        = string
  description = "Ingress pods replicas"
  default     = 2
}

variable "APP_IMAGE_REPOSITORY" {
  type        = string
  description = "App docker image, including private Container Registry and route to the image"
}

variable "APP_IMAGE_TAG" {
  type        = string
  description = "Docker image tag"
  default     = "latest"
}

variable "APP_IMAGE_REPLICACOUNT" {
  type        = number
  description = "App replicast to be created"
  default     = 2
}

variable "APP_IMAGE_PULLPOLICY" {
  type        = string
  description = "Image pull policy"
  default     = "Always"
}

variable "APP_INGRESS_TLS_ENABLED" {
  type        = bool
  description = "(Optional) Is TLS enabled for the application? Defaults to true"
  default     = true
}

variable "CLUSTER_ISSUER" {
  type        = string
  description = "cert-manager Issuer or ClusterIssuer name"
  default     = "letsencrypt"
}

variable DNS_ZONE_ENABLED {
  type = bool
  description = "(Optional) Is the DNS zone feature enabled?"
  default = false
}

variable DNS_ZONE_NAME {
  type        = string
  description = "(Optional) Domain name to create new domain entries "
  default     = ""
}

variable DNS_ZONE_RESOURCE_GROUP {
  type        = string
  description = "(Required if DNS_ZONE_NAME specified) Resource group where the DNS ZONE is created on"
  default     = ""
}

variable DNS_ZONE_RECORD {
  type        = string
  description = "(Required if DNS_ZONE_NAME specified) Domain name to create a new A entry, without the DNS Zone"
  default     = ""
}

variable DNS_TTL {
  type        = number
  description = "(Optional) DNS entry TTL. Defaults to 3600"
  default     = 3600
}
