#/bin/bash

set -euxo pipefail

[ -f ./pid ] && [ $(ps -p $(tail ./pid) -o pid=) ] && echo "yes" || echo "no"
