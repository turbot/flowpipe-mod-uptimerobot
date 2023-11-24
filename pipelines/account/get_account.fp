pipeline "get_account" {
  title       = "Get Account"
  description = "Get account details."

  param "api_key" {
    description = local.api_key_param_description
    type        = string
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
    value       = step.http.get_account.response_body.account
    description = "The account details."
  }

}