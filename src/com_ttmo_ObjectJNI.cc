#include "com_ttmo_ObjectJNI.h"
#include <string>

std::string globalData;

JNIEXPORT jstring JNICALL Java_com_ttmo_ObjectJNI_getData
    (JNIEnv *env, jobject) {
  return env->NewStringUTF(globalData.data());
}


JNIEXPORT void JNICALL Java_com_ttmo_ObjectJNI_setData
    (JNIEnv *env, jobject, jstring data) {
  env->PushLocalFrame(123);
  globalData = std::string(env->GetStringUTFChars(data, new jboolean(false)));
}
