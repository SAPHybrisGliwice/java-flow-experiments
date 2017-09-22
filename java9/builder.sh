#!/usr/bin/env bash

# if your JVM path is different, change it below
export BUILDER_JVM_PATH="/usr/lib/jvm/java-9-oracle"
export BUILDER_OUT_DIR="out/production/java9/"
export BUILDER_SRC_FILE="src/com/github/pwittchen/Main.java"
export BUILDER_MAIN_CLASS="com.github.pwittchen.Main"

function help() {
  echo ":help"
  echo "
     builder.sh is a simple shell script responsible
     for cleaning, building and running this Java 9 application

     Usage:
       -c    cleans the project (removes 'out/' directory)
       -b    builds (compiles) the project
       -r    runs the compiled project
       -h    shows help
  "
}

function clean() {
  echo ":clean"
  rm -rf $BUILDER_OUT_DIR
}

function build() {
  echo ":build"
  $BUILDER_JVM_PATH/bin/javac -d $BUILDER_OUT_DIR $BUILDER_SRC_FILE
}

function run() {
  echo ":run"
  $BUILDER_JVM_PATH/bin/java -Dfile.encoding=UTF-8 -classpath $BUILDER_OUT_DIR $BUILDER_MAIN_CLASS
}

while getopts "hcbr" opt; do
    case "$opt" in
    h)
        help
        exit 0
        ;;
    c)  clean
        ;;
    b)  build
        ;;
    r)  run
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift
