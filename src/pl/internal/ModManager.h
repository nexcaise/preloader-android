#pragma once
#include <filesystem>
#include <jni.h>
#include <string>

namespace ModManager {
bool IsModEnabled(const std::filesystem::path &configPath,
                  const std::string &modFileName);
void LoadAndInitializeEnabledMods(const std::string &modsDir,
                                  const std::string &dataDir, JavaVM *vm);
void LoadMod(JavaVM* vm, const char* path, int index = 0);
} // namespace ModManager