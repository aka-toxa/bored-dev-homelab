docker:
	ansible-playbook -i hosts ./docker.yml

cni:
	ansible-playbook -i hosts ./cni.yml

consul:
	ansible-playbook -i hosts ./consul.yml

nomad:
	ansible-playbook -i hosts ./nomad.yml

ALL: docker cni consul nomad
