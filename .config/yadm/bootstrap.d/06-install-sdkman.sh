#!/bin/bash

curl -s "https://get.sdkman.io" | bash

# shellcheck source=/dev/null
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 17.0.11-amzn
sdk install maven 3.9.6
