#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="/home/jenkins/tools"
BASE_URL="https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven"

mkdir -p "${INSTALL_DIR}"
cd /tmp

LATEST_VERSION="3.9.16"
SHA512_HASH="831a8591fe20c8243b1dbe7d71e3244f31d1665b0804b2e825e38cbbe5ce0cafb8338851f90780735568773e0a6cd07bbec107cda0b896b008b861075358b6f6"
#LATEST_VERSION="3.9.11"
#SHA512_HASH="bcfe4fe305c962ace56ac7b5fc7a08b87d5abd8b7e89027ab251069faebee516b0ded8961445d6d91ec1985dfe30f8153268843c89aa392733d1a3ec956c9978"
MAVEN_DIR="apache-maven-${LATEST_VERSION}"
TARBALL="${MAVEN_DIR}-bin.tar.gz"

echo "${BASE_URL}/${LATEST_VERSION}/${TARBALL}"

curl -fsSLO "${BASE_URL}/${LATEST_VERSION}/${TARBALL}"

echo "${SHA512_HASH}  ${TARBALL}" | sha512sum -c -

tar -xzf "${TARBALL}" --no-same-owner --no-same-permissions
mv "${MAVEN_DIR}" "${INSTALL_DIR}/"

rm -rf "/tmp/${TARBALL}" "/tmp/${TARBALL}.sha512"

ln -s /home/jenkins/tools/apache-maven-${LATEST_VERSION}/ /home/jenkins/tools/maven
