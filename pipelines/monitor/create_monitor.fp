pipeline "create_monitor" {
  title       = "Create Monitor"
  description = "Create new monitors of any type."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "friendly_name" {
    type        = string
    description = "The friendly name of the Monitor."
  }

  param "url" {
    type        = string
    description = "The URL/IP of the monitor."
  }

  param "type" {
    type        = number
    description = "The type of the monitor. Possible values are 1. HTTP(s), 2. Keyword, 3. Ping, 4. Port, 5. Heartbeat."
  }

  param "sub_type" {
    type        = number
    description = "The sub-type of the monitor. Required for port monitoring. Possible values are 1. HTTP(80), 2. HTTPS(443), 3. FTP(21), 4. SMTP(25), 5. POP3(110), 6. IMAP(143), 99. Custom Port(99)."
    optional    = true
  }

  param "port" {
    type        = number
    description = "The port of the monitor. Required for port monitoring."
    optional    = true
  }

  param "keyword_type" {
    type        = number
    description = "The type of keyword monitoring. Required for keyword monitoring. Possible values are 1. Exists, 2. Not Exists."
    optional    = true
  }

  param "keyword_value" {
    type        = string
    description = "The keyword value of the monitor. Required for keyword monitoring."
    optional    = true
  }

  step "http" "create_monitor" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/newMonitor"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode(merge(
      {
        for name, value in param : try(local.create_monitor_request_params[name], name) => value if contains(keys(local.create_monitor_request_params), name) && value != null
      },
      {
        api_key = credential.uptimerobot[param.cred].api_key
      }
    ))
  }

  output "monitor" {
    description = "The created monitor."
    value       = step.http.create_monitor.response_body.monitor
  }
}
