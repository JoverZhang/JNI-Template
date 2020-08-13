#!/bin/bash

cd "$(dirname "$0")" || exit 1

# Cut prefix with awk.
#
# $1: sourceString
function cutPrefix() {
  sourceString=$1

  # cut '.java'
  sourceString=${sourceString:0:-5}

  # cut './java/' or 'java/'
  if [[ ${sourceString:0:2} == './' ]]; then
    sourceString=${sourceString:7}
  else
    sourceString=${sourceString:5}
  fi

  echo "$sourceString"
}

# Translate to java-package name from directory
# e.g., `./com/ttmo/Demo.java` to `com.ttmo.Demo`.
#
# $1: directory of source
# $return: translated java-package name
function toPackageName() {
  source=$1
  delTail="${source/.java/}"
  echo "${delTail//\//.}"
}

function main() {
for i in ${*:1}
  do
    if [ ! -f "$i" ]; then
      echo "error: '$i' is not file"
      exit 1
    fi
    javac "$i"

    javaPath=$(cutPrefix "$i")
    javaPackageName=$(toPackageName "$javaPath")

    javah -classpath ./java "$javaPackageName"
  done
}

main "$@"
