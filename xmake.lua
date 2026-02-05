set_project("preloader")
set_languages("cxx20")
add_rules("mode.release")

add_requires("nlohmann_json 3.11.3")

-- =======================
-- STATIC LIB
-- =======================
target("preloader_static")
    set_kind("static")
    set_basename("preloader")

    add_files("src/**.cpp")
    add_includedirs("src", {public = true})
    add_defines("PRELOADER_EXPORT", "UNICODE")
    add_packages("nlohmann_json")

    if is_plat("android") then
        add_syslinks("log", "android", "EGL", "GLESv3")

        if is_arch("armeabi-v7a") then
            add_linkdirs("lib/ARM")
        elseif is_arch("arm64-v8a") then
            add_linkdirs("lib/ARM64")
        else
            raise("Unsupported ABI")
        end

        add_links("GlossHook")
    end

-- =======================
-- SHARED LIB
-- =======================
target("preloader_shared")
    set_kind("shared")
    set_basename("preloader")

    add_files("src/**.cpp")
    add_includedirs("src", {public = true})
    add_defines("PRELOADER_EXPORT", "UNICODE")
    add_packages("nlohmann_json")

    if is_plat("android") then
        add_syslinks("log", "android", "EGL", "GLESv3")

        if is_arch("armeabi-v7a") then
            add_linkdirs("lib/ARM")
        elseif is_arch("arm64-v8a") then
            add_linkdirs("lib/ARM64")
        else
            raise("Unsupported ABI")
        end

        add_links("GlossHook")
    end