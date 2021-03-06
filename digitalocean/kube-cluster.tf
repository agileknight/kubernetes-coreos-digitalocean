variable "do_ssh_key_id" {
    description = "digital ocean SSH key id"
}

resource "etcdiscovery_token" "do_cluster" {
    size = 3
}

resource "template_file" "do_cloud_config" {
    template = "${file("${path.module}/cloud-config.tpl")}"

    vars {
        etcd_discovery_url = "${etcdiscovery_token.do_cluster.id}"
    }
}

resource "digitalocean_droplet" "kube-master" {
    image = "coreos-beta"
    name = "kube-master"
    region = "fra1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.do_ssh_key_id}"]
    user_data = "${template_file.do_cloud_config.rendered}"
}

resource "digitalocean_droplet" "kube-slave01" {
    image = "coreos-beta"
    name = "kube-slave01"
    region = "fra1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.do_ssh_key_id}"]
    user_data = "${template_file.do_cloud_config.rendered}"
}

resource "digitalocean_droplet" "kube-slave02" {
    image = "coreos-beta"
    name = "kube-slave02"
    region = "fra1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.do_ssh_key_id}"]
    user_data = "${template_file.do_cloud_config.rendered}"
}

output "do_etcd_discovery_url" {
    value = "${etcdiscovery_token.do_cluster.id}"
}
