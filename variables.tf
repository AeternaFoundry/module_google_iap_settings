variable "iap_settings" {
  description = <<EOT
Map of iap_settings, attributes below
Required:
    - name
Optional:
    - deletion_policy
    - access_settings (block):
        - allowed_domains_settings (optional, block):
            - domains (optional)
            - enable (optional)
        - cors_settings (optional, block):
            - allow_http_options (optional)
        - gcip_settings (optional, block):
            - login_page_uri (optional)
            - tenant_ids (optional)
        - identity_sources (optional)
        - oauth_settings (optional, block):
            - client_id (optional)
            - client_secret (optional)
            - login_hint (optional)
            - programmatic_clients (optional)
        - reauth_settings (optional, block):
            - max_age (required)
            - method (required)
            - policy_type (required)
        - workforce_identity_settings (optional, block):
            - oauth2 (optional, block):
                - client_id (optional)
                - client_secret (optional)
            - workforce_pools (optional)
    - application_settings (block):
        - access_denied_page_settings (optional, block):
            - access_denied_page_uri (optional)
            - generate_troubleshooting_uri (optional)
            - remediation_token_generation_enabled (optional)
        - attribute_propagation_settings (optional, block):
            - enable (optional)
            - expression (optional)
            - output_credentials (optional)
        - cookie_domain (optional)
        - csm_settings (optional, block):
            - rctoken_aud (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    deletion_policy = optional(string)
    access_settings = optional(object({
      allowed_domains_settings = optional(object({
        domains = optional(list(string))
        enable  = optional(bool)
      }))
      cors_settings = optional(object({
        allow_http_options = optional(bool)
      }))
      gcip_settings = optional(object({
        login_page_uri = optional(string)
        tenant_ids     = optional(list(string))
      }))
      identity_sources = optional(list(string))
      oauth_settings = optional(object({
        client_id            = optional(string)
        client_secret        = optional(string)
        login_hint           = optional(string)
        programmatic_clients = optional(list(string))
      }))
      reauth_settings = optional(object({
        max_age     = string
        method      = string
        policy_type = string
      }))
      workforce_identity_settings = optional(object({
        oauth2 = optional(object({
          client_id     = optional(string)
          client_secret = optional(string)
        }))
        workforce_pools = optional(list(string))
      }))
    }))
    application_settings = optional(object({
      access_denied_page_settings = optional(object({
        access_denied_page_uri               = optional(string)
        generate_troubleshooting_uri         = optional(bool)
        remediation_token_generation_enabled = optional(bool)
      }))
      attribute_propagation_settings = optional(object({
        enable             = optional(bool)
        expression         = optional(string)
        output_credentials = optional(list(string))
      }))
      cookie_domain = optional(string)
      csm_settings = optional(object({
        rctoken_aud = optional(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

