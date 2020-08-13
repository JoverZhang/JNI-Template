#include "com_ttmo_HelloJNI.h"

JNIEXPORT jstring JNICALL Java_com_ttmo_HelloJNI_helloWorld
    (JNIEnv *env, jclass) {
  return env->NewStringUTF("Hello JNI !");
}
