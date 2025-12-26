#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="/home/jenkins/tools"
BASE_URL="https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven"

mkdir -p "${INSTALL_DIR}"
cd /tmp

LATEST_VERSION="3.9.12"
SHA512_HASH="0a1be79f02466533fc1a80abbef8796e4f737c46c6574ede5658b110899942a94db634477dfd3745501c80aef9aac0d4f841d38574373f7e2d24cce89d694f70"
MAVEN_DIR="apache-maven-${LATEST_VERSION}"
TARBALL="${MAVEN_DIR}-bin.tar.gz"

echo "${BASE_URL}/${LATEST_VERSION}/${TARBALL}"

curl -fsSLO "${BASE_URL}/${LATEST_VERSION}/${TARBALL}"

echo "${SHA512_HASH}  ${TARBALL}" | sha512sum -c -

tar -xzf "${TARBALL}" --no-same-owner --no-same-permissions
mv "${MAVEN_DIR}" "${INSTALL_DIR}/"

rm -rf "/tmp/${TARBALL}" "/tmp/${TARBALL}.sha512"

ln -s /home/jenkins/tools/apache-maven-${LATEST_VERSION}/ /home/jenkins/tools/maven