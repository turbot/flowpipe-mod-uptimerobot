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

# Common descriptions
locals {
  conn_param_description = "Name of UptimeRobot connection to use. If not provided, the default UptimeRobot connection will be used."
}
