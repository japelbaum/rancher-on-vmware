resource "null_resource" "wait_for_pong" {
  provisioner "local-exec" {
    command =  "bash wait_for_rancher.sh ${var.rancher_hostname}"
    }
} 

resource "rancher2_bootstrap" "admin" {
  depends_on = [null_resource.wait_for_pong]
  
  password = "Hello123"
  telemetry = true
}

resource "vault_generic_secret" "example" {
  path = "secret/rancherapitoken"

  data_json = <<EOT
{
  "rancherapitoken":   "${rancher2_bootstrap.admin.token}",
  "rancherapiurl" :   "${rancher2_bootstrap.admin.url}"
}
EOT 
}
