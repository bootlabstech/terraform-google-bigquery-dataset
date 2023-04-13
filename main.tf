resource "google_bigquery_dataset" "dataset" {
  project                     = var.project_id 
  count                       = var.no_of_datasets
  dataset_id                  = var.dataset_name[count.index] 
  location                    = var.location
  default_encryption_configuration {
    kms_key_name = var.kms_key_name
  }
  lifecycle {
     ignore_changes = [
# Ignore changes to tags, e.g. because a management agent
# updates these based on some ruleset managed elsewhere.
          labels,
 ]
 }
}
