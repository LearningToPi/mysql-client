ARG SOURCE_DISTRO
ARG SOURCE_TAG

FROM docker.io/${SOURCE_DISTRO}:${SOURCE_TAG}

RUN	dnf install mysql8.4 -y

LABEL   org.label-schema.changelog-url="https://github.com/LearningToPi/mysql-client/blob/main/release_notes/v1.0.0.md"
LABEL   org.label-schema.description="Lightweight image to run MRTG to generate the image data. Map the /var/www/mrtg to an appropriate web server (none included)"
LABEL   org.label-schema.name="mrtg"
LABEL   org.label-schema.release="$SOURCE_DISTRO-$SOURCE_TAG"
LABEL   org.label-schema.schema-version="1.0"
LABEL   org.label-schema.usage="README.md"
LABEL   org.label-schema.vcs-url="https://github.com/LearningToPi/mysql-client"
LABEL   org.label-schema.vendor="LearningToPi.com"
LABEL   org.label-schema.version="1.0.0"
LABEL   org.opencontainers.image.base.name="$SOURCE_DISTRO-$SOURCE_TAG"
LABEL   org.opencontainers.image.ref.name="$SOURCE_DISTRO"
LABEL   org.opencontainers.image.version="$SOURCE_TAG"

