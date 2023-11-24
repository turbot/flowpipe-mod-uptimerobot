pipeline "list_monitors" {
  title       = "List Monitors"
  description = "Lists all the monitors in a user's account."

  param "api_key" {
    description = local.api_key_param_description
    type        = string
    default     = var.api_key
  }

  step "http" "list_monitors" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/getMonitors"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key = param.api_key
      format  = "json"
      logs    = "1"
    })

  }

  output "monitors" {
    value       = step.http.list_monitors.response_body.monitors
    description = "The list of monitors."
  }

}