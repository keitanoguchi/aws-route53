resource "aws_route53_zone" "zone" {
  name = var.hosted_zone_name
  tags = var.tags
}

resource "aws_route53_record" "record" {
  for_each = {
    for record in var.records : record.for_each_key => record
  }

  zone_id = aws_route53_zone.zone.id
  name    = each.value.record_name
  type    = each.value.record_type
  ttl     = each.value.record_ttl
  records = each.value.record_values
}

resource "aws_route53_record" "alias" {
  for_each = {
    for record in var.alias_records : record.for_each_key => record
  }

  zone_id = aws_route53_zone.zone.id
  name    = each.value.record_name
  type    = "A"
  ttl     = each.value.record_ttl

  alias {
    name                   = each.value.alias_name
    zone_id                = each.value.alias_zone_id
    evaluate_target_health = true
  }
}
