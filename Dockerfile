FROM registry.hub.docker.com/jenkins/inbound-agent:jdk21
LABEL authors="Kydane"

USER root
COPY install-maven.sh /usr/local/bin/install-maven.sh
COPY install-docker-cli.sh /usr/local/bin/install-docker-cli.sh
RUN chmod +x /usr/local/bin/install-maven.sh \
 && chmod +x /usr/local/bin/install-docker-cli.sh \
 && /usr/local/bin/install-maven.sh \
 && /usr/local/bin/install-docker-cli.sh \
 && chown -R jenkins:jenkins /home/jenkins/tools

USER jenkins