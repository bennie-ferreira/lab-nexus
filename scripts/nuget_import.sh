#!/bin/bash

# Example:
# $: cd storage-nexus/
# $/storage-nexus: sh nuget_import.sh -k APIKEYFROMNEXUS - r http://localhost:8084/repository/nuget-hosted/

while getopts ":r:k:" opt; do
	case $opt in
		r) REPO_URL="$OPTARG"
		;;
		k) APIKEY="$OPTARG"
		;;
	esac
done

find . -type f -not -path '*/\.*' -name '*.nupkg' -exec nuget push {} $APIKEY -Source $REPO_URL \;
