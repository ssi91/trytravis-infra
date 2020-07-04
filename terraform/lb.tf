resource "yandex_lb_target_group" "tg" {
	name = "lb-target-group"

	folder_id = var.folder_id

	target {
		address = yandex_compute_instance.app.0.network_interface.0.ip_address
		subnet_id = var.subnet_id
	}
	target {
		address = yandex_compute_instance.app.1.network_interface.0.ip_address
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
