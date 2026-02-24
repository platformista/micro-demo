storage "raft" {
  path    = "/app/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "127.0.0.1:8888"
  tls_disable = "true"
}

api_addr = "http://127.0.0.1:8888"
cluster_addr = "https://127.0.0.1:8201"
ui = true