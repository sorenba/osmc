# Vero 5 split patch test status

Generated from `package/mediacenter-osmc/patches/vero5-000-add-vero-support.patch`.

Target source: Kodi 22 Alpha 3, `22.0a3-Piers`.

Test command per split patch, in original patch order:

```bash
patch --batch --forward --dry-run -p1 < split.patch
patch --batch --forward -p1 < split.patch
```

Only patches that passed dry-run were applied before testing the next split patch. This preserves order as much as possible.

Total split patches: 173
Working split patches: 171
Needs work: 2

## Fixed after initial split test

- `vero5-split-002-cmake-modules-FindFFMPEG.cmake.patch`
  - Updated for Kodi 22 `PATCH_COMMAND` layout.
  - Uses `COMMAND /bin/bash -c "cd <SOURCE_DIR> && patch ..."` entries.
  - Dry-run passed locally.

- `vero5-split-010-system-settings-settings.xml.patch`
  - Updated for Kodi 22 settings layout.
  - Keeps Vero video, HDMI, HDR, whitelist, and audio defaults.
  - Removes the memory-size hunk because Kodi 22 already defaults that setting to 64 MB.
  - Dry-run passed locally.

- `vero5-split-019-xbmc-application-Application.cpp.patch`
  - Updated for Kodi 22 code movement.
  - Kept Application.cpp changes in this split file and added the AML resize handler in `ApplicationMessageHandling.cpp`.
  - Updated stereo mode enum naming to `RenderStereoMode`.
  - Dry-run passed locally.

- `vero5-split-025-xbmc-cores-AudioEngine-Sinks-AESinkAUDIOTRACK.cpp.patch`
  - Updated Kodi 22 context for Android AudioTrack passthrough and AML old-mode handling.
  - Dry-run passed locally.

- `vero5-split-028-xbmc-cores-RetroPlayer-process-RPProcessInfo.h.patch`
  - Updated hunk context for Kodi 22.
  - Dry-run passed locally.

- `vero5-split-036-xbmc-cores-VideoPlayer-DVDCodecs-Overlay-DVDOverlayCodecFFmpeg.cpp.patch`
  - Updated for Kodi 22 `RenderStereoMode` enum naming.
  - Dry-run passed locally.

- `vero5-split-074-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemux.h.patch`
  - Updated for Kodi 22 `CDemuxStreamSubtitle` constructor style.
  - Dry-run passed locally.

- `vero5-split-085-xbmc-cores-VideoPlayer-DVDInputStreams-CMakeLists.txt.patch`
  - Updated Bluray condition from `BLURAY_FOUND` to `TARGET ${APP_NAME_LC}::Bluray`.
  - Dry-run passed locally.

- `vero5-split-086-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStream.h.patch`
  - Updated hunk context for Kodi 22 forward declarations.
  - Dry-run passed locally.

- `vero5-split-100-xbmc-cores-VideoPlayer-VideoRenderers-BaseRenderer.cpp.patch`
  - Updated include hunk context for Kodi 22 and kept the Vero aspect-ratio logic.
  - Dry-run passed locally.

- `vero5-split-108-xbmc-cores-VideoPlayer-VideoRenderers-OverlayRendererUtil.cpp.patch`
  - Updated for Kodi 22 `RenderStereoMode` and `RenderStereoView` enum naming.
  - Regenerated hunk counts so Linux `patch` accepts it.
  - Dry-run passed locally.

- `vero5-split-115-xbmc-guilib-GUITextLayout.cpp.patch`
  - Reduced to the Kodi 22-specific width calculation fixes that were still needed.
  - Dry-run passed locally.

- `vero5-split-116-xbmc-guilib-StereoscopicsManager.cpp.patch`
  - Updated for Kodi 22 `RenderStereoMode` enum naming and current stereoscopics code layout.
  - Keeps Vero full-SBS/full-TAB/MVC detection and 3D mode fallback logic.
  - Dry-run passed locally.

- `vero5-split-118-xbmc-interfaces-generic-LanguageInvokerThread.cpp.patch`
  - Removed obsolete trailing-newline-only hunk.
  - Kept the thread priority change.
  - Dry-run passed locally.

- `vero5-split-119-xbmc-messaging-ApplicationMessenger.h.patch`
  - Updated message ids for Kodi 22.
  - `TMSG_PROCESS_DELETE_AFTER_WATCH` already uses `TMSG_MASK_APPLICATION + 39`.
  - Added `TMSG_SETOSMCWALKTHROUGHSTATE` at `+40` and `TMSG_AML_RESIZE` at `+41`.
  - Dry-run passed locally.

- `vero5-split-128-xbmc-platform-linux-input-CMakeLists.txt.patch`
  - Updated for Kodi 22 `TARGET ${APP_NAME_LC}::LibInput` context.
  - Dry-run passed locally.

- `vero5-split-130-xbmc-platform-linux-storage-UDevProvider.cpp.patch`
  - Updated for Kodi 22 UDevProvider context.
  - Filters `/boot` and `/tee` mount points.
  - Dry-run passed locally.

- `vero5-split-133-xbmc-settings-AdvancedSettings.cpp.patch`
  - Updated for Kodi 22 extension and stereoscopic regex context.
  - Keeps `.ssif` video extension and MVC stereoscopic regex support.
  - Dry-run passed locally.

- `vero5-split-136-xbmc-settings-DisplaySettings.cpp.patch`
  - Updated for Kodi 22 display settings filler code.
  - Keeps 3D FP mode strings, Vero resolution display labels, 4K warning, and 3D calibration behavior.
  - Dry-run passed locally.

- `vero5-split-137-xbmc-settings-DisplaySettings.h.patch`
  - Updated hunk context for Kodi 22 `GetStringFromRes(...)` helper.
  - Dry-run passed locally.

- `vero5-split-145-xbmc-utils-BitstreamConverter.cpp.patch`
  - Updated all remaining hunks for Kodi 22 bitstream converter layout.
  - Keeps MVC extradata handling and safer unsigned NAL size handling.
  - Dry-run passed locally.

- `vero5-split-146-xbmc-utils-BitstreamConverter.h.patch`
  - Updated hunk context for Kodi 22 bitstream converter declarations.
  - Dry-run passed locally.

- `vero5-split-150-xbmc-utils-EGLUtils.cpp.patch`
  - Updated for Kodi 22 `make_map` and `std::string_view` EGL utility code.
  - Keeps the original intent of removing EGL debug setup and no-config-context usage.
  - Dry-run passed locally.

- `vero5-split-151-xbmc-utils-GLUtils.cpp.patch`
  - Updated for Kodi 22 `make_map` and `std::string_view` GL utility code.
  - Keeps the original intent of leaving GL debug lookup maps empty.
  - Dry-run passed locally.

- `vero5-split-161-xbmc-windowing-GraphicContext.cpp.patch`
  - Updated for Kodi 22 `RenderStereoMode` / `RenderStereoView` names and current `GraphicContext.cpp` layout.
  - Keeps Vero 3D flag conversion, Dolby Vision output check, and resolution reset behavior.
  - Dry-run passed locally.

- `vero5-split-162-xbmc-windowing-GraphicContext.h.patch`
  - Updated for Kodi 22 `RenderStereoMode` names and current `GraphicContext.h` layout.
  - Adds 3D FP mode flags and helper declarations used by the Vero 5 windowing patch.
  - Dry-run passed locally.

- `vero5-split-163-xbmc-windowing-Resolution.cpp.patch`
  - Updated with reduced ASCII-only hunks so the connector accepts the payload.
  - Keeps 3D whitelist selection, 2D fallback from 3D modes, and the helper for matching 3D resolutions.
  - Dry-run passed locally.

## Needs work

- `vero5-split-076-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemuxFFmpeg.cpp.patch`
  - Fails 2 of 26 hunks.

- `vero5-split-096-xbmc-cores-VideoPlayer-VideoPlayer.cpp.patch`
  - Fails 3 of 16 hunks.

## Working split patches

The remaining 171 split patches either applied during the initial full split test or were fixed afterward and dry-run validated locally.
