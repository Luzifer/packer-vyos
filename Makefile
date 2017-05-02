default: packer
	packer build packer.json

format:
	jq . packer.json > .packer.json
	mv .packer.json packer.json

packer:
	which packer
