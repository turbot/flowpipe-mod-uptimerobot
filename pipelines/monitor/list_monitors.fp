pipeline "list_monitors" {
  title       = "List Monitors"
  description = "Lists all the monitors in a user's account."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  # TODO: Add pagination support once https://github.com/turbot/flowpipe/issues/339 is resolved
  step "http" "list_monitors" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/getMonitors"

    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key = credential.uptimerobot[param.cred].api_key
      format  = "json"
      logs    = "1"
    })
  }

  output "monitors" {
    description = "The list of monitors."
    value       = step.http.list_monitors.response_body.monitors
  }

}
