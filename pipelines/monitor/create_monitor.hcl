pipeline "create_monitor" {
  title       = "Create a monitor in UptimeRobot"
  description = "This pipeline creates a monitor in UptimeRobot using the UptimeRobot API key."

  param "api_key" {
    description = "UptimeRobot API key for authentication."
    type        = string
    default     = var.api_key
  }

  param "friendly_name" {
    description = "The friendly name of the Monitor."
    type        = string
  }

  param "url" {
    description = "The URL to monitor."
    type        = string
  }

  param "type" {
    description = "The type of monitor (e.g., http, keyword, ping)."
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
    description = "The uptimerobot monitor that was created."
    value       = step.http.create_monitor.response_body
  }
}