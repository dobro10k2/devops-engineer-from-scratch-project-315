IMAGE_NAME=project-devops-deploy
DOCKER_REPO=ghcr.io/dobro10k2/project-devops-deploy

# Get short git commit sha
GIT_SHA := $(shell git rev-parse --short HEAD)

ansible:
	ansible-playbook playbook.yml -e docker_tag=$(or $(docker_tag),$(GIT_SHA)) --ask-vault-pass

deploy:
	ansible-playbook playbook.yml -e docker_tag=$(or $(docker_tag),$(GIT_SHA)) --tags deploy --ask-vault-pass

rollback:
	ansible-playbook playbook.yml -e docker_tag=$(TAG) --ask-vault-pass
