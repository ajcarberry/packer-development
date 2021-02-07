class Hash
  def slice(*keep_keys)
    h = {}
    keep_keys.each { |key| h[key] = fetch(key) if has_key?(key) }
    h
  end unless Hash.method_defined?(:slice)
  def except(*less_keys)
    slice(*keys - less_keys)
  end unless Hash.method_defined?(:except)
end

Vagrant.configure(2) do |config|
  config.vm.box = "dummy"

  config.vm.provider :aws do |aws, override|
    aws.aws_profile = "prod"
    
    aws.region = "us-east-1"
    aws.ami = "ami-02ef95c6b3ae2d995"
    aws.instance_type = "t3.medium"
    aws.subnet_id = "subnet-08f2332b73d4ef65e"
    aws.security_groups = "sg-0d2a2ff3feeb8a07a"
    aws.associate_public_ip = "true"

    override.ssh.username = "alfred"
    override.ssh.private_key_path = "~/.ssh/alfred"

    override.route53.hosted_zone_id = 'Z08482151BLZ8GEPWRD1P'
    override.route53.record_set     = %w(development.prod.carberry.io. A)
    override.ssh.insert_key         = false
  end
end