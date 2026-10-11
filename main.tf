data "oci_devops_build_runs" "devops_build_runs_lookup" {
  for_each = var.devops_build_runs_lookup

  build_pipeline_id = each.value.build_pipeline_id
  compartment_id    = each.value.compartment_id
  display_name      = each.value.display_name
  project_id        = each.value.project_id
  state             = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

