#!/bin/bash

# Fail on any error.
set -e

# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.
# set -x
echo "Build start"
#if ! command which flutter &> /dev/null
#then
  echo "Before git clone"
  cd ..
  pwd
   git clone https://github.com/flutter/flutter.git -b stable
    echo "Before export path"
    pwd
    ls
   export PATH="$PATH:/tmpfs/src/github/flutter/bin"
   echo $PATH
   pwd
   cd kokoro-codelab-dileepshah
   pwd
    echo "After export path"
#fi

pwd
#flutter analyze
flutter test
result=$?
check=0
if [ $result -ne $check ]; then
  echo "Failed some test cases"
  exit 1
fi
#flutter test
echo "Build end"