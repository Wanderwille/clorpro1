variable "yandex_cloud_id" {
  default = "b1gb93lpnjqmrui5gm09"
}

variable "yandex_folder_id" {
  default = "b1gvrb386rq9a96c5km4"
}

variable "ubuntu" {
  default = "fd8hglaneh113l00tv83"
}

variable "zone" {
  default = "ru-central1-a"  
}

variable "nat-instance-name" {
  default = "nat-instance-vm1"
}

variable "nat-instance-image-id" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "domain" {
  default = "test-vps.cloud"
}

variable "public-vm-name" {
  default = "public-vm1"
}

variable "private-vm-name" {
  default = "private-vm1"
}

variable "yandex_cloud_auth" {
  default = "tut pusto)"
  sensitive = true
}

variable "metadata_ssh" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys          = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILrmmjE2SF5JJsS9GChvmOkBc0uHHkuhHoG9b8zk1hZ0 root@User"
  }
}