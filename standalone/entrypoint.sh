#!/usr/bin/env bash

set -euo pipefail

export PATH="$PATH:/hbase/bin"
export HBASE_HOME="/hbase"

bash start-hbase.sh

jps

trap 'trap - INT; kill "$!"; exit' INT
exec tail -f /dev/null "$HBASE_HOME/logs/"* & wait $!

bash stop-hbase.sh
