#!/bin/bash

# Example:
# $: cd storage-nexus/
# $/storage-nexus: npm login --registry http://localhost:8084/repository/npm-internal/
# $/storage-nexus: sh npm_import.sh -r http://localhost:8084/repository/npm-internal/

while getopts ":r:k:" opt; do
	case $opt in
		r) REPO_URL="$OPTARG"
		;;
	esac
done

find . -type f -not -path '*/\.*' -name '*.tgz' -exec npm publish {} --registry $REPO_URL \;
