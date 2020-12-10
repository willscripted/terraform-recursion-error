PWD=`pwd`
TERRAFORM_VERSION=0.13.5

default:
	echo -n "\nUsage:\n\n  make console    Run /bin/sh in a hashicorp/terraform container.\n  make show       Just show the recursion error.\n"

console:
	docker run -it --rm  \
		-v ${PWD}/:/apps \
		-w /apps \
		--entrypoint /bin/sh \
		hashicorp/terraform:${TERRAFORM_VERSION}

show:
	docker run -it --rm  \
		-v ${PWD}/:/apps \
		-w /apps \
		hashicorp/terraform:${TERRAFORM_VERSION} init

.PHONY: console show default
