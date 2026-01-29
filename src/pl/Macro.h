#pragma once

#ifdef __cplusplus
#define PRELOADER_MAYBE_UNUSED [[maybe_unused]]
#else
#define PRELOADER_MAYBE_UNUSED
#endif

#define PLAPI [[maybe_unused]] __attribute__((visibility("default")))

#ifdef __cplusplus
#define PLCAPI extern "C" PLAPI
#else
#define PLCAPI extern PLAPI
#endif
