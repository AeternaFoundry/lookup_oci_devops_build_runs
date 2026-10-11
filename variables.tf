variable "devops_build_runs_lookup" {
  description = <<EOT
Map of devops_build_runs_lookup, attributes below
Optional:
    - build_pipeline_id
    - compartment_id
    - display_name
    - project_id
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    build_pipeline_id = optional(string)
    compartment_id    = optional(string)
    display_name      = optional(string)
    project_id        = optional(string)
    state             = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

