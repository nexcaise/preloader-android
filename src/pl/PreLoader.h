#pragma once
#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

void addAssetOverride(JNIEnv *env, const std::string path);

void addAssetOverride(JNIEnv *env, const char* path);
#ifdef __cplusplus
}
#endif