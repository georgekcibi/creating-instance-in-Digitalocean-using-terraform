terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}

provider "digitalocean" {
  # Configuration options
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}


provider "digitalocean" {
  token = "dop_v1_fa789e470d190d30c98baa6832abee6364040992c5ce4b7763170b5587276b39"
}

resource "digitalocean_ssh_key" "my-key" {
  name       = "my-key"
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "droplet" {
  name   = "Jenkins-slave"
  region = "blr1"
  size   = "s-2vcpu-4gb"
  image  = "ubuntu-20-04-x64"

  ssh_keys = [
    digitalocean_ssh_key.my-key.fingerprint
  ]

  connection {
    type        = "ssh"
    user        = "root"
    password    = "82TS89ugnh8dI"
    private_key = file("/root/.ssh/id_rsa")
    host        = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'root:82TS89ugnh8dI' | chpasswd",
      "sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config",
      "systemctl restart sshd"
    ]
  }
}
