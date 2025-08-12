ui = true
disable_mlock = true

listener "tcp" {
  address         = "0.0.0.0:8300"
  cluster_address = "0.0.0.0:8301"
  tls_disable     = true
}

storage "consul" {
  address = "consul:8500"
  path    = "vault/"
}

api_addr     = "http://<YOUR_SERVER_IP>:8300"
cluster_addr = "http://<YOUR_SERVER_IP>:8301"
