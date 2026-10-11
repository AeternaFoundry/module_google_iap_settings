output "iap_settings_id" {
  description = "Map of id values across all iap_settings, keyed the same as var.iap_settings except keys with no id are omitted"
  value       = { for k, v in google_iap_settings.iap_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iap_settings_access_settings" {
  description = "Map of access_settings values across all iap_settings, keyed the same as var.iap_settings except keys with no access_settings are omitted"
  value       = { for k, v in google_iap_settings.iap_settings : k => one(v.access_settings) if v.access_settings != null && length(v.access_settings) > 0 }
  sensitive   = true
}
output "iap_settings_application_settings" {
  description = "Map of application_settings values across all iap_settings, keyed the same as var.iap_settings except keys with no application_settings are omitted"
  value       = { for k, v in google_iap_settings.iap_settings : k => one(v.application_settings) if v.application_settings != null && length(v.application_settings) > 0 }
}
output "iap_settings_deletion_policy" {
  description = "Map of deletion_policy values across all iap_settings, keyed the same as var.iap_settings except keys with no deletion_policy are omitted"
  value       = { for k, v in google_iap_settings.iap_settings : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "iap_settings_name" {
  description = "Map of name values across all iap_settings, keyed the same as var.iap_settings except keys with no name are omitted"
  value       = { for k, v in google_iap_settings.iap_settings : k => v.name if v.name != null && length(v.name) > 0 }
}

