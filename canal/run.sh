#!/bin/bash

mv /canal/jdk8 /usr/local/jdk8

cat >> /etc/profile << EOF
export JAVA_HOME=/usr/local/jdk8
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$JAVA_HOME:$PATH
EOF

source /etc/profile

sh /canal/canal-server/bin/startup.sh
sh /canal/canal-adapter/bin/startup.sh