data "aws_route53_zone" "morooka" {
  name = "morooka3.net"
}

resource "aws_route53_record" "morooka" {
  zone_id = "${data.aws_route53_zone.morooka.zone_id}"
  name    = "${data.aws_route53_zone.morooka.name}"
  type    = "A"

  alias {
    name                   = "${aws_lb.lb.dns_name}"
    zone_id                = "${aws_lb.lb.zone_id}"
    evaluate_target_health = true
  }
}

#SSL証明の発行(ACM)
resource "aws_acm_certificate" "morooka" {
  domain_name               = "${data.aws_route53_zone.morooka.name}"
  subject_alternative_names = []
  validation_method         = "DNS"
}
#DNSレコードのリソース作成
resource "aws_route53_record" "morooka_certificate" {
  zone_id = "${data.aws_route53_zone.morooka.id}"
  name    = "${aws_acm_certificate.morooka.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.morooka.domain_validation_options.0.resource_record_type}"
  records = [
    "${aws_acm_certificate.morooka.domain_validation_options.0.resource_record_value}"
  ]
  ttl = 60
}
