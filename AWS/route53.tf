resource "aws_route53_zone" "main" {
  name = "www.example.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.nat.public_ip]
}
