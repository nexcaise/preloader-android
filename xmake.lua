set_project("preloader")
set_languages("cxx20")
add_rules("mode.release")

add_requires("nlohmann_json 3.11.3")

local function common_cfg(t)
    t:add_files("src/**.cpp")
    t:add_includedirs("src", {public = true})
    t:add_defines("PRELOADER_EXPORT", "UNICODE")
    t:add_packages("nlohmann_json")

    if is_plat("android") then
        t:add_syslinks("log", "android", "EGL", "GLESv3")

        if is_arch("armeabi-v7a") then
            t:add_linkdirs("lib/ARM")
        elseif is_arch("arm64-v8a") then
            t:add_linkdirs("lib/ARM64")
        else
            raise("Unsupported ABI")
        end

        t:add_links("GlossHook")
    end
end

target("preloader_static")
    set_kind("static")
    set_basename("preloader")
    common_cfg(target)

target("preloader_shared")
    set_kind("shared")
    set_basename("preloader")
    common_cfg(target)