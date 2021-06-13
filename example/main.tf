module "main" {
  source = "../"

  hosted_zone_name = "example.com"
  records = [
    {
      for_each_key  = "www.example.com"
      record_name   = "www.example.com"
      record_type   = "A"
      record_ttl    = 300
      record_values = ["123.4.5.6"]
    }
  ]
  tags = {
    ManagedBy = "Terraform"
  }
}
