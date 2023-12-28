datacenter = "pi-homelab-01" # define datacenter ID
data_dir = "/opt/consul/data"
retry_join = ["192.168.0.101", "192.168.0.102", "192.168.0.103", "192.168.0.104"] # the list of all nodes IP addresses
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "{{ GetInterfaceIP \"eth0\" }}"
domain = "homelab" # Define the top level DNS domain for service discovery

ui_config {
  enabled = true
}
