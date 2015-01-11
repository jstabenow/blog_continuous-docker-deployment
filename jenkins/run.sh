#!/bin/bash
HOST=${HOST}
JENKINS_PORT=${PORT0}
JENKINS_SLAVE_PORT=${PORT1}
MESOS_ZK=${MESOS_ZK}
sed -e "s/##HOST##/$HOST/g;s/##JENKINS_PORT##/$JENKINS_PORT/g;" /jenkins.model.JenkinsLocationConfiguration.xml > /var/lib/jenkins/jenkins.model.JenkinsLocationConfiguration.xml
sed -e "s/##MESOS_ZK##/$MESOS_ZK/g;s/##JENKINS_SLAVE_PORT##/$JENKINS_SLAVE_PORT/g;" config.xml > /var/lib/jenkins/config.xml
java -jar /usr/share/jenkins/jenkins.war --webroot=war --httpPort=$PORT0 --ajp13Port=-1 --httpListenAddress=0.0.0.0 --ajp13ListenAddress=127.0.0.1 --preferredClassLoader=java.net.URLClassLoader --logfile=/mnt/mesos/sandbox/jenkins.log
