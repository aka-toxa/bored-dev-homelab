job "mysql" {
  datacenters = ["pi-homelab-01"]
  namespace   = "test"
  type        = "service"

  group "mysql" {
    network {
      mode = "bridge"
      port "db" {
        static = 3306
        to     = 3306
      }
    }

    volume "mysql_data" {
      type            = "csi"
      source          = "mysql"
      access_mode     = "multi-node-multi-writer"
      attachment_mode = "file-system"
    }

    task "instance" {
      driver = "docker"

      service {
        name = "mysql"
        port = "db"
        check {
          type     = "tcp"
          interval = "30s"
          timeout  = "2s"
        }
      }

      config {
        image = "mysql:8.2.0"
      }

      volume_mount {
        volume      = "mysql_data"
        destination = "/var/lib/mysql"
      }

      env {
        MYSQL_ROOT_PASSWORD = "root"
      }

      resources {
        cpu        = 1800
        memory     = 1024
      }
    }
  }
}
