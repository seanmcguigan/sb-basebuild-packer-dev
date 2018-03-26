#!/usr/bin/env bash

BUILD_NUMBER=00

echo ""
echo "This script creates the template package what can be distributed ower to other teams."
echo ""

PACK_NAME=jsb-ami-build-template-v${BUILD_NUMBER}-$(date +%d-%m-%Y).zip
zip -9r ${PACK_NAME} packer-build-template \
		-x \*.retry \*gitignore

echo ""
echo "Package created with name ${PACK_NAME} in the current folder."
echo ""