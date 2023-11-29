pipeline "get_account" {
  title       = "Get Account"
  description = "Get account details."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  step "http" "get_account" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/getAccountDetails"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key = param.api_key
      format  = "json"
    })
  }

  output "account" {
    description = "The account details."
    value       = step.http.get_account.response_body.account
  }

}