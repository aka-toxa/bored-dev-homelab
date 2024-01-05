# Define the Consul datacenter where our nodes are running
datacenter = "pi-homelab-01"
data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

# server is a Nomad API server
server {
  enabled          = true
  # Expect at least 3 nodes to be online to start cluster leader election
  bootstrap_expect = 3
}

# client is a service that run the jobs
client {
  enabled = true
}

plugin "docker" {
  config {
    allow_privileged = true
  }
}

ui {
  enabled = true
}
