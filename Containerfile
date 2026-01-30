ARG SOURCE_DISTRO
ARG SOURCE_TAG
ARG BUILD_VERSION
ARG MYSQL_VERSION

FROM docker.io/${SOURCE_DISTRO}:${SOURCE_TAG}

ARG SOURCE_DISTRO
ARG SOURCE_TAG
ARG BUILD_VERSION
ARG MYSQL_VERSION

RUN	dnf install mysql${MYSQL_VERSION} -y

LABEL   org.label-schema.changelog-url="https://github.com/LearningToPi/mysql-client"
LABEL   org.label-schema.description="Containerized Mysql client"
LABEL   org.label-schema.name="mysql-client"
LABEL   org.label-schema.release="$SOURCE_DISTRO-$SOURCE_TAG-$BUILD_VERSION"
LABEL   org.label-schema.schema-version="1.0"
LABEL   org.label-schema.usage="README.md"
LABEL   org.label-schema.vcs-url="https://github.com/LearningToPi/mysql-client"
LABEL   org.label-schema.vendor="LearningToPi.com"
LABEL   org.label-schema.version="$BUILD_VERSION"
LABEL   org.opencontainers.image.base.name="$SOURCE_DISTRO-$SOURCE_TAG"
LABEL   org.opencontainers.image.ref.name="$SOURCE_DISTRO"
LABEL   org.opencontainers.image.version="$SOURCE_TAG"

