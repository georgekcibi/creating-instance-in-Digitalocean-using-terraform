# creating-instance-in-Digitalocean-using-terraform

The repro provides the code for creating an instance in Digital ocean. The plan is to create an Ubuntu instance of size 2 CPU and 4GB RAM in the Banglore region. The code also resets the password of the root user as Digital Ocean instance created by defult uses key based authentication instead of password.

/root/.ssh/id_rsa.pub: File contains the public_key
/root/.ssh/id_rsa: File contains private key


After cloning the repro, and adding the private keys and public keys in the mentioned files run terraform init which initiales the code and installed the required plugins and providers.

root@jenkins-master:~/terraform# terraform init

Initializing the backend...

Initializing provider plugins...
- Finding digitalocean/digitalocean versions matching "2.26.0"...
- Installing digitalocean/digitalocean v2.26.0...
- Installed digitalocean/digitalocean v2.26.0 (signed by a HashiCorp partner, key ID F82037E524B9C0E8)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

##After that terraform plan which runs as a dry run.

root@jenkins-master:~/terraform# terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_droplet.droplet will be created
  + resource "digitalocean_droplet" "droplet" {
      + backups              = false
      + created_at           = (known after apply)
      + disk                 = (known after apply)
      + graceful_shutdown    = false
      + id                   = (known after apply)
      + image                = "ubuntu-20-04-x64"
      + ipv4_address         = (known after apply)
      + ipv4_address_private = (known after apply)
      + ipv6                 = false
      + ipv6_address         = (known after apply)
      + locked               = (known after apply)
      + memory               = (known after apply)
      + monitoring           = false
      + name                 = "Jenkins-slave"
      + price_hourly         = (known after apply)
      + price_monthly        = (known after apply)
      + private_networking   = (known after apply)
      + region               = "blr1"
      + resize_disk          = true
      + size                 = "s-2vcpu-4gb"
      + ssh_keys             = (known after apply)
      + status               = (known after apply)
      + urn                  = (known after apply)
      + vcpus                = (known after apply)
      + volume_ids           = (known after apply)
      + vpc_uuid             = (known after apply)
    }

  # digitalocean_ssh_key.my-key will be created
  + resource "digitalocean_ssh_key" "my-key" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + name        = "my-key"
      + public_key  = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3zWKgE3hmVct93WoYa8dsMYpVNgLFGTS95/q54JKAq4jTbciP5X9iPU2jyqaXmP0vdEVfFHaDafECfUV+vrvUJPs48vP10U6hdg0aYEihaC298Z0FnUx/87WlMBfxKm84go0QhLH+SEZH/9uoUjxXX2mABhX1p8NFZPXPDEPG0eOojcrmRS4HS/XZHX2LCViQ04UtiH7cjSVV9OxKyl2p6krTqXRMYmbpXq7vHmzc0aWgwQ9V4mTr5Ndco7Pfs+sEGNaZiseg5BmmZLXvWBABNtVtT0PQJ6mIVV1LvgIEW8Pz4I1EWg88xGVYcHUa3YLCJvMtZxM9FFUlywigJ67d7F16LbGTxleasnBB8SWJxqjjeZxU1ITO5IjEUc5zoSpGQ4+MLglK8OnaXrINhlMpH2Sh1PwKJYM9kY/6XT9TMiJrCBenmkgKtwWgdNsJ5in4kgyH8CtXl+84TJDJzQdBtJf4oz4DWldp7acm2YKxwk4y7NyER4qWmTzFmyTqX3k= root@jenkins-master
        EOT
    }

Plan: 2 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.

## terraform apply for creating the instance


root@jenkins-master:~/terraform# terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_droplet.droplet will be created
  + resource "digitalocean_droplet" "droplet" {
      + backups              = false
      + created_at           = (known after apply)
      + disk                 = (known after apply)
      + graceful_shutdown    = false
      + id                   = (known after apply)
      + image                = "ubuntu-20-04-x64"
      + ipv4_address         = (known after apply)
      + ipv4_address_private = (known after apply)
      + ipv6                 = false
      + ipv6_address         = (known after apply)
      + locked               = (known after apply)
      + memory               = (known after apply)
      + monitoring           = false
      + name                 = "Jenkins-slave"
      + price_hourly         = (known after apply)
      + price_monthly        = (known after apply)
      + private_networking   = (known after apply)
      + region               = "blr1"
      + resize_disk          = true
      + size                 = "s-2vcpu-4gb"
      + ssh_keys             = (known after apply)
      + status               = (known after apply)
      + urn                  = (known after apply)
      + vcpus                = (known after apply)
      + volume_ids           = (known after apply)
      + vpc_uuid             = (known after apply)
    }

  # digitalocean_ssh_key.my-key will be created
  + resource "digitalocean_ssh_key" "my-key" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + name        = "my-key"
      + public_key  = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3zWKgE3hmVct93WoYa8dsMYpVNgLFGTS95/q54JKAq4jTbciP5X9iPU2jyqaXmP0vdEVfFHaDafECfUV+vrvUJPs48vP10U6hdg0aYEihaC298Z0FnUx/87WlMBfxKm84go0QhLH+SEZH/9uoUjxXX2mABhX1p8NFZPXPDEPG0eOojcrmRS4HS/XZHX2LCViQ04UtiH7cjSVV9OxKyl2p6krTqXRMYmbpXq7vHmzc0aWgwQ9V4mTr5Ndco7Pfs+sEGNaZiseg5BmmZLXvWBABNtVtT0PQJ6mIVV1LvgIEW8Pz4I1EWg88xGVYcHUa3YLCJvMtZxM9FFUlywigJ67d7F16LbGTxleasnBB8SWJxqjjeZxU1ITO5IjEUc5zoSpGQ4+MLglK8OnaXrINhlMpH2Sh1PwKJYM9kY/6XT9TMiJrCBenmkgKtwWgdNsJ5in4kgyH8CtXl+84TJDJzQdBtJf4oz4DWldp7acm2YKxwk4y7NyER4qWmTzFmyTqX3k= root@jenkins-master
        EOT
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

digitalocean_ssh_key.my-key: Creating...
digitalocean_ssh_key.my-key: Creation complete after 2s [id=37576433]
digitalocean_droplet.droplet: Creating...
digitalocean_droplet.droplet: Still creating... [10s elapsed]
digitalocean_droplet.droplet: Still creating... [20s elapsed]
digitalocean_droplet.droplet: Still creating... [30s elapsed]
digitalocean_droplet.droplet: Still creating... [40s elapsed]
digitalocean_droplet.droplet: Provisioning with 'remote-exec'...
digitalocean_droplet.droplet (remote-exec): Connecting to remote host via SSH...
digitalocean_droplet.droplet (remote-exec):   Host: 64.227.176.61
digitalocean_droplet.droplet (remote-exec):   User: root
digitalocean_droplet.droplet (remote-exec):   Password: true
digitalocean_droplet.droplet (remote-exec):   Private key: true
digitalocean_droplet.droplet (remote-exec):   Certificate: false
digitalocean_droplet.droplet (remote-exec):   SSH Agent: false
digitalocean_droplet.droplet (remote-exec):   Checking Host Key: false
digitalocean_droplet.droplet (remote-exec):   Target Platform: unix
digitalocean_droplet.droplet: Still creating... [50s elapsed]
digitalocean_droplet.droplet (remote-exec): Connecting to remote host via SSH...
digitalocean_droplet.droplet (remote-exec):   Host: 64.227.176.61
digitalocean_droplet.droplet (remote-exec):   User: root
digitalocean_droplet.droplet (remote-exec):   Password: true
digitalocean_droplet.droplet (remote-exec):   Private key: true
digitalocean_droplet.droplet (remote-exec):   Certificate: false
digitalocean_droplet.droplet (remote-exec):   SSH Agent: false
digitalocean_droplet.droplet (remote-exec):   Checking Host Key: false
digitalocean_droplet.droplet (remote-exec):   Target Platform: unix
digitalocean_droplet.droplet (remote-exec): Connecting to remote host via SSH...
digitalocean_droplet.droplet (remote-exec):   Host: 64.227.176.61
digitalocean_droplet.droplet (remote-exec):   User: root
digitalocean_droplet.droplet (remote-exec):   Password: true
digitalocean_droplet.droplet (remote-exec):   Private key: true
digitalocean_droplet.droplet (remote-exec):   Certificate: false
digitalocean_droplet.droplet (remote-exec):   SSH Agent: false
digitalocean_droplet.droplet (remote-exec):   Checking Host Key: false
digitalocean_droplet.droplet (remote-exec):   Target Platform: unix
digitalocean_droplet.droplet (remote-exec): Connected!
digitalocean_droplet.droplet: Creation complete after 55s [id=341647606]

Finally the instance will be created
