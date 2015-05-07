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

.SHELLFLAGS = -e
.PHONY: setup-server update-server
.NOTPARALLEL:

default: server
server: setup-server
update: update-server
setup-server: do-setup-server
update-server: do-update-server

do-setup-server do-update-server:
	ansible-playbook $(subst do-,,$@).yml $(options) $(extra-options)

# Version Bump using bumpversion
patch:
	bumpversion patch
major:
	bumpversion major
minor:
	bumpversion minor
