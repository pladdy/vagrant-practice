#!/usr/bin/env bash

# also put on the VM but run after provisioning

TMP_ROOT=/tmp
GO_PKG=go1.8.1.linux-amd64.tar.gz

echo "Installing golang ${GO_PKG}"
tar -C /usr/local -xzf ${TMP_ROOT}/${GO_PKG}
