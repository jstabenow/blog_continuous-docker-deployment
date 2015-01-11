# Base Image
FROM ubuntu:14.04

# Jenkins + Plugins
RUN apt-get update && \
    apt-get install -y wget openjdk-7-jre-headless git-core unzip curl apache2-utils && \
    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
    echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update && \
    apt-get install -y jenkins && \
    mkdir -p /var/lib/jenkins/plugins && \
    (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/credentials.hpi) && \
    (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/envinject.hpi) && \
    (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/envfile.hpi) && \
    (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/build-environment.hpi) && \
    (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/analysis-core.hpi) && \
    (cd /var/lib/jenkins/plugins && wget --no-check-certificate https://updates.jenkins-ci.org/download/plugins/mesos/0.5.0/mesos.hpi)
ADD config.xml /config.xml
ADD jenkins /etc/default/jenkins
ADD jenkins.model.JenkinsLocationConfiguration.xml /jenkins.model.JenkinsLocationConfiguration.xml

# Mesos
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]') && \
    CODENAME=$(lsb_release -cs) && \
    echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update && \
    apt-get install -y mesos && \
    locale-gen en_US.UTF-8

# Env + Run
ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_PORT 9090
ENV JENKINS_SLAVE_PORT 8081
ENV MESOS_ZK 10.0.100.61:2181,10.0.100.62:2181,10.0.100.63:2181
ADD run.sh /run.sh
RUN chmod +x /run.sh

# ContainerSettings
CMD ["/run.sh", "-n"]
