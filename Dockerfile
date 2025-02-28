FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ansible \
    docker.io \
    curl \
    iputils-ping \
    openssh-client \
    python3-minimal && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com focal main" > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y terraform && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
