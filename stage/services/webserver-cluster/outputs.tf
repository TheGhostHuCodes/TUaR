output "address" {
  value = "${module.webserver_cluster.elb_dns_name}"
}
