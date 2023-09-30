#!/bin/sh
echo "vm.overcommit_memory=1" > /etc/sysctl.d/overcommit_memory.conf
sysctl -p /etc/sysctl.d/overcommit_memory.conf

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails s -b 0.0.0.0
