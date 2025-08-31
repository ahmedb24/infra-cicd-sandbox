locals {
  nsg_rules = [{
    name        = "allow_ssh"
    description = "Allow SSH from corp IPs (mock)"
    priority    = 100
    direction   = "Inbound"
    access      = "Allow"
    protocol    = "Tcp"
    source      = "203.0.113.0/24"
    destination = "10.20.1.0/24"
    port        = 22
  }]
}
