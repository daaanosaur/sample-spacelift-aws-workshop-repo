variable "repository_name" {
  type        = string
  description = "The name of the Git repository holding the infrastructure code."
  # Only change this if you renamed your fork.
  default = "sample-spacelift-aws-workshop-repo"
}

variable "repository_branch" {
  type        = string
  description = "The branch the stacks track."
  default     = "main"
}

variable "tf_version" {
  type        = string
  description = "The OpenTofu version the stacks use."
  default     = "1.10.3"
}

variable "vcs" {
  type = object({
    type       = string
    enterprise = optional(bool, false)
    namespace  = optional(string)
    id         = optional(string)
    url        = optional(string)
  })
  description = "VCS integration the stacks source their code from."

  # enterprise = false uses your Spacelift account's default GitHub integration,
  # which is what you get when you sign up to Spacelift with GitHub. Nothing to
  # change here. Only if you use a GitHub (custom app) integration instead, set
  # enterprise = true and add namespace (your GitHub user or org) and id (the
  # integration ID).
  default = {
    type       = "GITHUB"
    enterprise = false
  }
}

variable "aws_integration_id" {
  type        = string
  description = "The ID of the Spacelift AWS integration the stacks assume for cloud credentials."

  # CHANGE ME: the ID of your Spacelift AWS integration. Find it under
  # Integrate services > AWS in the Spacelift UI.
  default = "01M4GGFH2TZHK2TV3WYPVZXPRD"
}

variable "kubectl_version" {
  type        = string
  description = "The kubectl version the argocd stack uses. 'latest' takes the newest version Spacelift offers."
  default     = "latest"
}

variable "argocd_namespace" {
  type        = string
  description = "Namespace the argocd stack applies its manifests into. Must match argocd_namespace in aws/eks/variables.tf."
  default     = "argocd"
}
