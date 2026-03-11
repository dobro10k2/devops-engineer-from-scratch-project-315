IMAGE_NAME=devops-engineer-from-scratch-project-315
DOCKER_REPO=ghcr.io/dobro10k2/devops-engineer-from-scratch-project-315

# Get short git commit sha
GIT_SHA := $(shell git rev-parse --short HEAD)

ansible:
	ansible-playbook playbook.yml -e docker_tag=$(or $(docker_tag),$(GIT_SHA)) --ask-vault-pass

deploy:
	ansible-playbook playbook.yml -e docker_tag=$(or $(docker_tag),$(GIT_SHA)) --tags deploy --ask-vault-pass
