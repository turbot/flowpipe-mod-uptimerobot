pipeline "update_monitor" {
  title       = "Update a monitor in UptimeRobot"
  description = "This pipeline updates a monitor in UptimeRobot using the UptimeRobot API key."

  param "api_key" {
    description = "UptimeRobot API key for authentication."
    type        = string
    default     = var.api_key
  }

  param "friendly_name" {
    description = "The friendly name of the Monitor."
    type        = string
  }

  param "id" {
    description = "The ID of the monitor to update."
    type        = number
  }

  param "url" {
    description = "The URL of the monitor."
    type        = string
  }

  step "http" "update_monitor" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/editMonitor"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key       = param.api_key
      friendly_name = param.friendly_name
      id            = param.id
      url           = param.url
      format        = "json"
      logs          = "1"
    })

  }

  output "monitor" {
    description = "The uptimerobot monitor that was updated."
    value       = step.http.update_monitor.response_body
  }
}