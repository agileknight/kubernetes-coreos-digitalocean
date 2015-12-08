variable "do_ssh_key_id" {
    description = "digital ocean SSH key id"
}

resource "digitalocean_droplet" "kube-master" {
    image = "coreos-beta"
    name = "kube-master"
    region = "fra1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.do_ssh_key_id}"]
}