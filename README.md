# packer-development
=========

A brief description of the role goes here.

# Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should
be mentioned here. For instance, if the role uses the EC2 module, it may be a
good idea to mention in this section that the boto package is required.

python3+
pipenv

# Role Variables
--------------

A description of the settable variables for this role should go here, including
any variables that are in defaults/main.yml, vars/main.yml, and any variables
that can/should be set via parameters to the role. Any variables that are read
from other roles and/or the global scope (ie. hostvars, group vars, etc.) should
be mentioned here as well.

## Packer Variables
"aws_region": "us-east-1",
"environment": null,
"build_version": null,
"share_with_aws_accounts": "",
"packer_instance_type": "t3.micro",
"security_group_name": "external_protected",
"ansible_extra_args": "",
"build_tag": "acarberry/development"

# Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in
regards to parameters that may need to be set for other roles, or variables that
are used from other roles.

https://github.com/ajcarberry/ansible-role-development.git

### Ansible Variables
Pyenv Version to install
pyenv_version: "v1.2.20"

Python versions to install
pyenv_python_versions:
  - "3.8.5"
  - "3.7.8"
  - "3.6.11"
  - "2.7.18"

Set global pyenv version
pyenv_global: "3.8.5 system"

Code-Server DNS name
host_name: development.local

Service Code-Server Owner
owner_user: root
owner_group: root
service_owner: root

# Example Usage
----------------

pipenv update
pipenv shell
packer build -only='amazon-ebs' -var 'environment=prod' -var 'build_version=0.0.1' development.json

# License
-------

MIT

# Author Information
------------------

Alex Carberry