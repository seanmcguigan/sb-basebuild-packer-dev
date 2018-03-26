#!/usr/bin/env bash

AWS_REGION=eu-west-1

validate() {
	packer validate ${1}
	if [[ $? -ne 0 ]]; then
		echo "Packer template validation failed"
		exit 1
	fi
}

build() {
	packer build \
			-var-file=parameters.json \
			-var "aws_access_key=${AWS_ACCESS_KEY_ID}" \
			-var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}" \
			-var "aws_session_token=${AWS_SESSION_TOKEN}" \
			-var "aws_region=${AWS_REGION}" \
		${1}
}

if [[ -z ${BUILD_NUMBER} ]]; then
	echo ""
	echo ""
	echo "!ERROR! The BUILD_NUMBER env variable must be set"
	echo ""
	echo ""
	exit 1
fi

if [[ -z ${OS} ]]; then
	echo ""
	echo ""
	echo "!ERROR! The OS env variable must be set."
	echo "        Valid values are: (rh7, ws2016)"
	echo ""
	echo ""
	exit 1
fi

case ${OS} in
	rh7)
		PACKER_FILE=packer-sb-rh7-cis.json
		;;
	ws2016)
		PACKER_FILE=packer-sb-ws2016-cis-l2.json
		;;
	*)
		echo ""
		echo "!ERROR! The OS env variable must be set."
		echo "        Valid values are: (rh7, ws2016)"
		echo ""
		exit 1
		;;
esac

validate ${PACKER_FILE}
build ${PACKER_FILE}
