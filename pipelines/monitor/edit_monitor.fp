pipeline "edit_monitor" {
  title       = "Edit Monitor"
  description = "Edit a monitor."

  param "api_key" {
    description = local.api_key_param_description
    type        = string
    default     = var.api_key
  }

  param "friendly_name" {
    description = "The friendly name of the Monitor."
    type        = string
  }

  param "monitor_id" {
    description = "The ID of the monitor to be edited."
    type        = number
  }

  param "url" {
    description = "The URL/IP of the monitor."
    type        = string
  }

  step "http" "edit_monitor" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/editMonitor"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key       = param.api_key
      friendly_name = param.friendly_name
      id            = param.monitor_id
      url           = param.url
      format        = "json"
      logs          = "1"
    })

  }

  output "monitor" {
    value       = step.http.edit_monitor.response_body.monitor
    description = "The updated monitor."
  }
}