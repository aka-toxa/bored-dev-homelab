plugin_id   = "smb"
type        = "csi"
namespace   = "test"
id          = "mysql"
name        = "mysql"
external_id = "mysql"

capability {
  access_mode = "multi-node-multi-writer"
  attachment_mode = "file-system"
}

context {
  source = "//192.168.0.1/G/.nomad_data/mysql"
}

mount_options {
  mount_flags = [ "guest","rw","iocharset=utf8","vers=2.0", "dir_mode=0700", "file_mode=0700", "uid=999", "gid=999" ]
}
