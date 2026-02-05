set_project("preloader")
set_languages("cxx20")
add_rules("mode.release")

add_requires("nlohmann_json 3.11.3")

local function common_cfg(target)
    target:add_files("src/**.cpp")
    target:add_includedirs("src", {public = true})
    target:add_defines("PRELOADER_EXPORT", "UNICODE")
    target:add_packages("nlohmann_json")

    if is_plat("android") then
        target:add_syslinks("log", "android", "EGL", "GLESv3")

        if is_arch("armeabi-v7a") then
            target:add_linkdirs("lib/ARM")
        elseif is_arch("arm64-v8a") then
            target:add_linkdirs("lib/ARM64")
        else
            raise("Unsupported ABI")
        end

        target:add_links("GlossHook")
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