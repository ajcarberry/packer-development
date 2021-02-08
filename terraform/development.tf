data "template_file" "alex_user_data" {
  template = file("scripts/cloud-init.yaml")
  vars = {
      hostname  = var.alex_hostname
      email     = var.alex_email
  }
}
resource "aws_instance" "alex_development" {
  ami               = data.aws_ami.development.id
  instance_type     = "t3.medium"
  subnet_id         = module.dmz_subnet_1.dmz_subnet_id
  vpc_security_group_ids = [
      aws_security_group.sg_development_default.id,
      aws_security_group.sg_external_protected.id,
      aws_security_group.sg_http.id
  ]
  user_data         = data.template_file.alex_user_data.rendered
  tags              = {
    Name = "Alex's Dev Instance"
    Automation = "terraform"
  }
}
resource "aws_route53_record" "alex_development" {
  zone_id = data.aws_route53_zone.prod_carberry_io.zone_id
  name    = var.alex_hostname
  type    = "A"
  ttl     = "300"
  records = [aws_instance.alex_development.public_ip]
}