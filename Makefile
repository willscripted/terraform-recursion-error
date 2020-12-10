PWD=`pwd`
TERRAFORM_VERSION=0.14.2

default:
	echo -n "\nUsage:\n\n  make console    Run /bin/sh in a hashicorp/terraform container.\n  make show       Just show the recursion error.\n"

console:
	docker run -it --rm  \
		-v ${PWD}/:/apps \
		-w /apps \
		--entrypoint /bin/sh \
		hashicorp/terraform:${TERRAFORM_VERSION}

console-debug:
	docker run -it --rm  \
		-v ${PWD}/:/apps \
		-w /apps \
		-e "TF_LOG=trace" \
		--entrypoint /bin/sh \
		hashicorp/terraform:${TERRAFORM_VERSION}

show:
	docker run -it --rm  \
		-v ${PWD}/:/apps \
		-w /apps \
		hashicorp/terraform:${TERRAFORM_VERSION} init

show-debug:
	docker run -it --rm  \
		-v ${PWD}/:/apps \
		-e "TF_LOG=trace" \
		-w /apps \
		hashicorp/terraform:${TERRAFORM_VERSION} init

.PHONY: console show default
