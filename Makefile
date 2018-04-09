ifndef branch
	branch ?= $(shell git rev-parse --abbrev-ref HEAD)
endif

ifndef revision
	revision ?= $(shell git rev-parse HEAD)
endif

ifdef debug
	options += -vvv
endif

ifdef tags
	options += --tags $(tags)
endif

ifdef ssh_key_file
	options += -e ssh_key_file=$(ssh_key_file)
endif

ifdef instance_host
	options += -e instance_host=$(instance_host)
endif

ifdef vaultpass
	options += --vault-password-file $(abspath $(vaultpass))
else
	vaultpass ?= $(wildcard .vault-pass)
	ifneq ($(vaultpass),)
		options += --vault-password-file $(abspath $(vaultpass))
	endif
endif

ifdef config
	options += -e config=$(config)
endif

ifdef askpass
	options += --ask-pass
endif

.SHELLFLAGS = -e
.PHONY: setup-server update-server
.NOTPARALLEL:

default: server
server: setup-server
bootstrap: setup-bootstrap
postgresql: setup-postgresql
update: update-server
reboot: reboot-server
deploy: deploy-web
docker: setup-docker
setup-server: do-setup-server
setup-bootstrap: do-setup-bootstrap
setup-postgresql: do-setup-postgresql
setup-docker: do-setup-docker
update-server: do-update-server
reboot-server: do-reboot-server
deploy-web: do-deploy-web

do-setup-server do-setup-bootstrap do-setup-postgresql do-update-server do-reboot-server do-deploy-web do-setup-docker:
	ansible-playbook $(subst do-,,$@).yml $(options) $(extra-options)

# Version Bump using bumpversion
patch:
	bumpversion patch
major:
	bumpversion major
minor:
	bumpversion minor
