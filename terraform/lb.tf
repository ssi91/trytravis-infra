resource "yandex_compute_instance" "app1" {
  name = "reddit-app1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app1.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false

    private_key = file(var.private_key_path)
  }
}

resource "yandex_lb_target_group" "tg" {
	name = "lb-target-group"

	folder_id = var.folder_id

	target {
		address = yandex_compute_instance.app.network_interface.0.ip_address
		subnet_id = var.subnet_id
	}
	target {
		address = yandex_compute_instance.app1.network_interface.0.ip_address
		subnet_id = var.subnet_id
	}
}

resource "yandex_lb_network_load_balancer" "lb" {
	name = "load-balancer"

	listener {
		name = "listener"

		port = 80
		target_port = 9292
		external_address_spec {
			ip_version = "ipv4"
		}
	}

	attached_target_group {
		target_group_id = yandex_lb_target_group.tg.id

		healthcheck {
			name = "http"
			http_options {
				port = 9292
				path = "/"
			}
		}
	}
}
