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
