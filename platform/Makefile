namespace:
	nomad namespace apply platform

volumes:
	nomad job run ./volumes/csi-smb-plugin-nodes.job.hcl
	nomad job run ./volumes/csi-smb-plugin-controller.job.hcl

ALL: namespace volumes
