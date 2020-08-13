#!/bin/bash

cd "$(dirname "$0")" || exit 1

javac com/ttmo/JNITest.java
java -Djava.library.path=$PWD com.ttmo.JNITest
