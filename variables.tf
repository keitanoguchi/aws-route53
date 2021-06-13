variable "tags" {
  type    = map(any)
  default = {}
}

variable "hosted_zone_name" {
  type    = string
  default = null
}

variable "records" {
  type = list(object({
    for_each_key  = string
    record_name   = string
    record_type   = string
    record_ttl    = number
    record_values = list(any)
  }))
  default = []
}

variable "alias_records" {
  type = list(object({
    for_each_key  = string
    record_name   = string
    record_ttl    = number
    alias_name    = string
    alias_zone_id = string
  }))
  default = []
}
