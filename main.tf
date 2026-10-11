resource "google_iap_settings" "iap_settings" {
  for_each = var.iap_settings

  name            = each.value.name
  deletion_policy = each.value.deletion_policy

  dynamic "access_settings" {
    for_each = each.value.access_settings != null ? [each.value.access_settings] : []
    content {
      dynamic "allowed_domains_settings" {
        for_each = access_settings.value.allowed_domains_settings != null ? [access_settings.value.allowed_domains_settings] : []
        content {
          domains = allowed_domains_settings.value.domains
          enable  = allowed_domains_settings.value.enable
        }
      }
      dynamic "cors_settings" {
        for_each = access_settings.value.cors_settings != null ? [access_settings.value.cors_settings] : []
        content {
          allow_http_options = cors_settings.value.allow_http_options
        }
      }
      dynamic "gcip_settings" {
        for_each = access_settings.value.gcip_settings != null ? [access_settings.value.gcip_settings] : []
        content {
          login_page_uri = gcip_settings.value.login_page_uri
          tenant_ids     = gcip_settings.value.tenant_ids
        }
      }
      identity_sources = access_settings.value.identity_sources
      dynamic "oauth_settings" {
        for_each = access_settings.value.oauth_settings != null ? [access_settings.value.oauth_settings] : []
        content {
          client_id            = oauth_settings.value.client_id
          client_secret        = oauth_settings.value.client_secret
          login_hint           = oauth_settings.value.login_hint
          programmatic_clients = oauth_settings.value.programmatic_clients
        }
      }
      dynamic "reauth_settings" {
        for_each = access_settings.value.reauth_settings != null ? [access_settings.value.reauth_settings] : []
        content {
          max_age     = reauth_settings.value.max_age
          method      = reauth_settings.value.method
          policy_type = reauth_settings.value.policy_type
        }
      }
      dynamic "workforce_identity_settings" {
        for_each = access_settings.value.workforce_identity_settings != null ? [access_settings.value.workforce_identity_settings] : []
        content {
          dynamic "oauth2" {
            for_each = workforce_identity_settings.value.oauth2 != null ? [workforce_identity_settings.value.oauth2] : []
            content {
              client_id     = oauth2.value.client_id
              client_secret = oauth2.value.client_secret
            }
          }
          workforce_pools = workforce_identity_settings.value.workforce_pools
        }
      }
    }
  }

  dynamic "application_settings" {
    for_each = each.value.application_settings != null ? [each.value.application_settings] : []
    content {
      dynamic "access_denied_page_settings" {
        for_each = application_settings.value.access_denied_page_settings != null ? [application_settings.value.access_denied_page_settings] : []
        content {
          access_denied_page_uri               = access_denied_page_settings.value.access_denied_page_uri
          generate_troubleshooting_uri         = access_denied_page_settings.value.generate_troubleshooting_uri
          remediation_token_generation_enabled = access_denied_page_settings.value.remediation_token_generation_enabled
        }
      }
      dynamic "attribute_propagation_settings" {
        for_each = application_settings.value.attribute_propagation_settings != null ? [application_settings.value.attribute_propagation_settings] : []
        content {
          enable             = attribute_propagation_settings.value.enable
          expression         = attribute_propagation_settings.value.expression
          output_credentials = attribute_propagation_settings.value.output_credentials
        }
      }
      cookie_domain = application_settings.value.cookie_domain
      dynamic "csm_settings" {
        for_each = application_settings.value.csm_settings != null ? [application_settings.value.csm_settings] : []
        content {
          rctoken_aud = csm_settings.value.rctoken_aud
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

