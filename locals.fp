# Common descriptions
locals {
  api_key_param_description = "API key for your UptimeRobot account."
}

locals {
  create_monitor_request_params = {
    friendly_name = "friendly_name"
    url           = "url"
    type          = "type"
    sub_type      = "sub_type"
    port          = "port"
    keyword_type  = "keyword_type"
    keyword_value = "keyword_value"
  }
}