pipeline "get_account" {
  title       = "Get Account"
  description = "Get account details."

  tags = {
    type = "featured"
  }

  param "conn" {
    type        = connection.uptimerobot
    description = local.conn_param_description
    default     = connection.uptimerobot.default
  }

  step "http" "get_account" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/getAccountDetails"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key = param.conn.api_key
      format  = "json"
    })
  }

  output "account" {
    description = "The account details."
    value       = step.http.get_account.response_body.account
  }
}
