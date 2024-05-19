#!/bin/bash -x

set -e

source ./download.conf

info() {
	echo "I: $@"
}

warning() {
	echo "W: $@" >&2
}

error() {
	echo "E: $@" >&2
	exit 1
}

tmpdir="$(mktemp -d)"
cleanup() {
	rm -rf "${tmpdir}"
}

trap cleanup EXIT

rm -rf downloaded_artifacts
mkdir -p downloaded_artifacts

curl -L "${SYSTEM_DOWNLOAD_URL}" > "${PWD}/downloaded_artifacts/system.img"
curl -L "${VENDOR_DOWNLOAD_URL}" > "${PWD}/downloaded_artifacts/vendor.img"
