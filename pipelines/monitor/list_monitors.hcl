pipeline "list_monitors" {
  title       = "List All Monitors in UptimeRobot"
  description = "This pipeline lists all monitors in UptimeRobot using the UptimeRobot API."

  param "api_key" {
    description = "UptimeRobot API key for authentication."
    type        = string
    default     = var.api_key
  }

  step "http" "list_monitors" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/getMonitors"
    request_headers = {
      Content-Type = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key = param.api_key
      format  = "json"
      logs    = "1"
    })

  }

  output "monitors" {
    value       = step.http.list_monitors.response_body
    description = "The list of monitors in UptimeRobot."
  }

}