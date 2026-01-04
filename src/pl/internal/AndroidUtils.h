#pragma once
#include <jni.h>
#include <string>
struct AndroidContextPaths {
  std::string cacheDir;
  std::string modsDir;
};

namespace AndroidUtils {
jobject GetGlobalContext(JNIEnv *env);
std::string GetAbsolutePath(JNIEnv *env, jobject fileObj);
jobject getMCActivity(JNIEnv *env);
//void ReloadMinecraft(JNIEnv *env);
std::string GetSelectedModsDir(JNIEnv *env, jobject context);
AndroidContextPaths FetchContextPaths(JNIEnv *env);
} // namespace AndroidUtils
