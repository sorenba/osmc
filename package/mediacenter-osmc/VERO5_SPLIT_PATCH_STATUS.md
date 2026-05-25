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
Working split patches: 152
Needs work: 21

## Fixed after initial split test

- `vero5-split-002-cmake-modules-FindFFMPEG.cmake.patch`
  - Updated for Kodi 22 `PATCH_COMMAND` layout.
  - Uses `COMMAND /bin/bash -c "cd <SOURCE_DIR> && patch ..."` entries.
  - Dry-run passed locally.

- `vero5-split-019-xbmc-application-Application.cpp.patch`
  - Updated for Kodi 22 code movement.
  - Kept Application.cpp changes in this split file and added the AML resize handler in `ApplicationMessageHandling.cpp`.
  - Updated stereo mode enum naming to `RenderStereoMode`.
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

- `vero5-split-119-xbmc-messaging-ApplicationMessenger.h.patch`
  - Updated message ids for Kodi 22.
  - `TMSG_PROCESS_DELETE_AFTER_WATCH` already uses `TMSG_MASK_APPLICATION + 39`.
  - Added `TMSG_SETOSMCWALKTHROUGHSTATE` at `+40` and `TMSG_AML_RESIZE` at `+41`.
  - Dry-run passed locally.

## Needs work

- `vero5-split-010-system-settings-settings.xml.patch`
  - Fails 3 of 14 hunks in `system/settings/settings.xml`.

- `vero5-split-025-xbmc-cores-AudioEngine-Sinks-AESinkAUDIOTRACK.cpp.patch`
  - Fails 1 of 9 hunks.

- `vero5-split-076-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemuxFFmpeg.cpp.patch`
  - Fails 2 of 26 hunks.

- `vero5-split-096-xbmc-cores-VideoPlayer-VideoPlayer.cpp.patch`
  - Fails 3 of 16 hunks.

- `vero5-split-100-xbmc-cores-VideoPlayer-VideoRenderers-BaseRenderer.cpp.patch`
  - Fails 1 of 3 hunks.

- `vero5-split-108-xbmc-cores-VideoPlayer-VideoRenderers-OverlayRendererUtil.cpp.patch`
  - Fails 1 hunk.

- `vero5-split-115-xbmc-guilib-GUITextLayout.cpp.patch`
  - Fails 1 hunk.

- `vero5-split-116-xbmc-guilib-StereoscopicsManager.cpp.patch`
  - Fails 3 of 6 hunks.

- `vero5-split-118-xbmc-interfaces-generic-LanguageInvokerThread.cpp.patch`
  - Fails 1 of 2 hunks.

- `vero5-split-128-xbmc-platform-linux-input-CMakeLists.txt.patch`
  - Fails 1 hunk.

- `vero5-split-130-xbmc-platform-linux-storage-UDevProvider.cpp.patch`
  - Fails 1 hunk.

- `vero5-split-133-xbmc-settings-AdvancedSettings.cpp.patch`
  - Fails 1 of 3 hunks.

- `vero5-split-136-xbmc-settings-DisplaySettings.cpp.patch`
  - Fails 2 of 12 hunks.

- `vero5-split-137-xbmc-settings-DisplaySettings.h.patch`
  - Fails 1 hunk.

- `vero5-split-145-xbmc-utils-BitstreamConverter.cpp.patch`
  - Fails 5 of 8 hunks.

- `vero5-split-146-xbmc-utils-BitstreamConverter.h.patch`
  - Fails 1 hunk.

- `vero5-split-150-xbmc-utils-EGLUtils.cpp.patch`
  - Fails 2 of 3 hunks.

- `vero5-split-151-xbmc-utils-GLUtils.cpp.patch`
  - Fails 1 hunk.

- `vero5-split-161-xbmc-windowing-GraphicContext.cpp.patch`
  - Fails 2 of 12 hunks.

- `vero5-split-162-xbmc-windowing-GraphicContext.h.patch`
  - Fails 1 of 4 hunks.

- `vero5-split-163-xbmc-windowing-Resolution.cpp.patch`
  - Fails 4 of 11 hunks.

## Working split patches

The remaining 152 split patches either applied during the initial full split test or were fixed afterward and dry-run validated locally.
