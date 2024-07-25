output "master_ip" {
  value = google_compute_instance.k8s-master.network_interface[0].access_config[0].nat_ip
}

output "node_1_ip" {
  value = google_compute_instance.k8s-node-1.network_interface[0].access_config[0].nat_ip
}

output "node_2_ip" {
  value = google_compute_instance.k8s-node-2.network_interface[0].access_config[0].nat_ip
}

resource "null_resource" "update_custom_ini" {
  provisioner "local-exec" {
    command = "./update_custom_ini.sh ${google_compute_instance.k8s-master.network_interface[0].access_config[0].nat_ip} ${google_compute_instance.k8s-node-1.network_interface[0].access_config[0].nat_ip} ${google_compute_instance.k8s-node-2.network_interface[0].access_config[0].nat_ip}"
  }

  depends_on = [
    google_compute_instance.k8s-master,
    google_compute_instance.k8s-node-1,
    google_compute_instance.k8s-node-2
  ]
}
