pipeline "get_account" {
  title       = "Get Account"
  description = "Get account details."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  step "http" "get_account" {
    method = "POST"
    url    = "https://api.uptimerobot.com/v2/getAccountDetails"
    request_headers = {
      Content-Type  = "application/json"
      Cache-Control = "no-cache"
    }

    request_body = jsonencode({
      api_key = credential.uptimerobot[param.cred].api_key
      format  = "json"
    })
  }

  output "account" {
    description = "The account details."
    value       = step.http.get_account.response_body.account
  }
}
