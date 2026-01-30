#!/bin/bash -v

source ./vars.sh

VERSION=$1
MYSQL_VERSION=$2

ARCH=$(
    case "$UNAME_ARCH" in
	("x86_64") echo "amd64" ;;
	("amd64") echo "amd64" ;;
	("aarch64") echo "arm64" ;;
	("arm64") echo "arm64" ;;
	("riscv64") echo "riscv64" ;;
    esac)

docker pull docker.io/${SOURCE_DISTRO}:${SOURCE_TAG}
RETCODE=$?
if [ "${RETCODE}" -ne 0 ] ; then
    echo "Failed to pull ${SOURCE_DISTRO}:{$SOURCE_TAG}.  Return code ${RECODE}"
    quit $RETCODE
fi

echo ""
echo "Pulled ${IMAGE_DISTRO}:${IMAGE_VERSION}"

docker build -f Containerfile . -t $REGISTRY/$PACKAGE:${VERSION}-$ARCH -t $REGISTRY/$PACKAGE:latest-$ARCH --build-arg SOURCE_DISTRO="${SOURCE_DISTRO}" --build-arg SOURCE_TAG="${SOURCE_TAG}" --build-arg BUILD_VERSION="${VERSION}" --build-arg MYSQL_VERSION="${MYSQL_VERSION}"
RETCODE=$?

if [ "${RETCODE}" -ne 0 ] ; then
    echo "\n\nBuild failed with return code $RETCODE"
    exit $RETCODE
fi

echo ""
echo "Build completeled for $REGISTRY/$PACKAGE:$VERSION using $SOURCE_DISTRO:$SOURCE_TAG"
