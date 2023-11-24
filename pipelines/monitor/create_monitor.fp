pipeline "create_monitor" {
  title       = "Create Monitor"
  description = "Create new monitors of any type."

  param "api_key" {
    description = local.api_key_param_description
    type        = string
    default     = var.api_key
  }

  param "friendly_name" {
    description = "The friendly name of the Monitor."
    type        = string
  }

  param "url" {
    description = "The URL/IP of the monitor."
    type        = string
  }

  param "type" {
    description = "The type of the monitor. Possible values are 1. HTTP(s), 2. Keyword, 3. Ping, 4. Port, 5. Heartbeat."
    type        = number
  }

  step "http" "create_monitor" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/newMonitor"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key       = param.api_key
      friendly_name = param.friendly_name
      url           = param.url
      type          = param.type
      format        = "json"
      logs          = "1"
    })

  }

  output "monitor" {
    value       = step.http.create_monitor.response_body.monitor
    description = "The created monitor."
  }
}