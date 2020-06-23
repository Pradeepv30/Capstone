# Create Google Cloud VM | vm.tf

# Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 4
}

# Create VM - Backend Server
resource "google_compute_instance" "vm_instance_backend" {
  name         = "${var.project_name}-auto-server-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = var.gcp_zone_1
  #hostname     = "${var.app_name}-vm-${random_id.instance_id.hex}.${var.app_domain}"
  tags         = ["ssh","http"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "apt update; apt-get install git curl software-properties-common -y; git clone https://github.com/Pradeepv30/autoScripts.git; cd autoScripts; ./dockerInstall.sh"

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.public_subnet_1.name
    network_ip    = "10.10.1.10"
    access_config { }
  }
} 