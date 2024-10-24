pipeline "edit_monitor" {
  title       = "Edit Monitor"
  description = "Edit a monitor."

  param "conn" {
    type        = connection.uptimerobot
    description = local.conn_param_description
    default     = connection.uptimerobot.default
  }

  param "friendly_name" {
    type        = string
    description = "The friendly name of the Monitor."
  }

  param "monitor_id" {
    type        = number
    description = "The ID of the monitor to be edited."
  }

  param "url" {
    type        = string
    description = "The URL/IP of the monitor."
  }

  step "http" "edit_monitor" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/editMonitor"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key       = param.conn.api_key
      friendly_name = param.friendly_name
      id            = param.monitor_id
      url           = param.url
      format        = "json"
      logs          = "1"
    })

  }

  output "monitor" {
    description = "The updated monitor details."
    value       = step.http.edit_monitor.response_body.monitor
  }
}
