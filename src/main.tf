resource "yandex_compute_instance" "nat-instance" {
  name = var.nat-instance-name
  hostname = "${var.nat-instance-name}.${var.domain}"
  zone = var.zone
  allow_stopping_for_update = true

  resources {
    cores = 2
    core_fraction = 5
    memory = 2  
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.nat-instance-image-id
      name = "root-${var.nat-instance-name}"
      type = "network-nvme"
      size = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-public.id
    ip_address = var.nat-instance-ip
    nat = true
  }

  metadata = {
    ssh-keys = var.metadata_ssh["ssh-keys"]
  }
}

resource "yandex_compute_instance" "public-vm" {
  name = var.public-vm-name
  hostname = "${var.public-vm-name}.${var.domain}"
  zone = var.zone

  resources {
    cores = 2
    core_fraction = 5
    memory = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu
      name = "root-${var.public-vm-name}"
      type = "network-nvme"
      size = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-public.id
    nat = true
  }

  metadata = {
    ssh-keys = var.metadata_ssh["ssh-keys"]
  }
}

resource "yandex_compute_instance" "private-vm" {
  name = var.private-vm-name
  hostname = "${var.private-vm-name}.${var.domain}"
  zone = var.zone

  resources {
    cores = 2
    core_fraction = 5
    memory = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu
      name = "root-${var.private-vm-name}"
      type = "network-nvme"
      size = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-private.id
    nat = false
  }

  metadata = {
    ssh-keys = var.metadata_ssh["ssh-keys"]
  }
}