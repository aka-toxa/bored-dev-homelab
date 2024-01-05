job "csi-smb-plugin-controller" {
  datacenters = ["pi-homelab-01"]
  namespace   = "platform"

  group "controller" {
    count = 2

    task "plugin" {
      driver = "docker"

      config {
        image = "mcr.microsoft.com/k8s/csi/smb-csi:v1.7.0"
        args = [
          "--v=5",
          "--nodeid=${attr.unique.hostname}",
          "--endpoint=unix:///csi/csi.sock",
          "--drivername=smb.csi.k8s.io"
        ]
      }

      csi_plugin {
        id        = "smb"
        type      = "controller"
        mount_dir = "/csi"
      }

      resources {
        memory = 50
        memory_max = 256
        cpu    = 100
      }
    }
  }
}
