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
Working split patches: 149
Needs work: 24

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

- `vero5-split-119-xbmc-messaging-ApplicationMessenger.h.patch`
  - Updated message ids for Kodi 22.
  - `TMSG_PROCESS_DELETE_AFTER_WATCH` already uses `TMSG_MASK_APPLICATION + 39`.
  - Added `TMSG_SETOSMCWALKTHROUGHSTATE` at `+40` and `TMSG_AML_RESIZE` at `+41`.
  - Dry-run passed locally.

## Needs work

- `vero5-split-010-system-settings-settings.xml.patch` -> `b/system/settings/settings.xml`

  ```text
  checking file system/settings/settings.xml
  Hunk #3 FAILED at 2637.
  Hunk #4 FAILED at 2645.
  Hunk #7 FAILED at 3181.
  3 out of 14 hunks FAILED
  ```

- `vero5-split-025-xbmc-cores-AudioEngine-Sinks-AESinkAUDIOTRACK.cpp.patch` -> `b/xbmc/cores/AudioEngine/Sinks/AESinkAUDIOTRACK.cpp`

  ```text
  checking file xbmc/cores/AudioEngine/Sinks/AESinkAUDIOTRACK.cpp
  Hunk #7 FAILED at 1171.
  1 out of 9 hunks FAILED
  ```

- `vero5-split-074-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemux.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemux.h`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemux.h
  Hunk #1 FAILED at 189.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-076-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemuxFFmpeg.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemuxFFmpeg.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
  Hunk #18 FAILED at 1759.
  Hunk #20 FAILED at 1879.
  Hunk #22 FAILED at 2016.
  3 out of 22 hunks FAILED
  ```

- `vero5-split-085-xbmc-cores-VideoPlayer-DVDInputStreams-CMakeLists.txt.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/CMakeLists.txt`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDInputStreams/CMakeLists.txt
  Hunk #1 FAILED at 31.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-086-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStream.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStream.h`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStream.h
  Hunk #1 FAILED at 46.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-089-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamFile.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamFile.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamFile.cpp
  Hunk #1 FAILED at 39.
  Hunk #2 FAILED at 100.
  2 out of 2 hunks FAILED
  ```

- `vero5-split-090-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamFile.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamFile.h`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamFile.h
  Hunk #1 FAILED at 33.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-091-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamMemory.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamMemory.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamMemory.cpp
  Hunk #1 FAILED at 34.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-092-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamMemory.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamMemory.h`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamMemory.h
  Hunk #1 FAILED at 32.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-101-xbmc-cores-VideoPlayer-Process-VideoBufferManager.cpp.patch` -> `b/xbmc/cores/VideoPlayer/Process/VideoBufferManager.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/Process/VideoBufferManager.cpp
  Hunk #1 FAILED at 99.
  1 out of 6 hunks FAILED
  ```

- `vero5-split-105-xbmc-cores-VideoPlayer-VideoRenderers-BaseRenderer.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/BaseRenderer.h`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/BaseRenderer.h
  Hunk #1 FAILED at 145.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-106-xbmc-cores-VideoPlayer-VideoRenderers-CMakeLists.txt.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/CMakeLists.txt`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/CMakeLists.txt
  Hunk #1 FAILED at 22.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-110-xbmc-cores-VideoPlayer-VideoRenderers-RenderManager.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/RenderManager.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/RenderManager.cpp
  Hunk #1 FAILED at 38.
  Hunk #2 FAILED at 115.
  Hunk #3 FAILED at 566.
  Hunk #4 FAILED at 661.
  Hunk #6 FAILED at 1188.
  Hunk #7 FAILED at 1351.
  Hunk #8 FAILED at 1396.
  Hunk #9 FAILED at 1424.
  Hunk #10 FAILED at 1504.
  Hunk #11 FAILED at 1540.
  Hunk #12 FAILED at 1575.
  Hunk #13 FAILED at 1699.
  Hunk #15 FAILED at 1746.
  13 out of 15 hunks FAILED
  ```

- `vero5-split-111-xbmc-cores-VideoPlayer-VideoRenderers-RenderManager.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/RenderManager.h`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/RenderManager.h
  Hunk #1 FAILED at 64.
  Hunk #2 FAILED at 107.
  Hunk #3 FAILED at 173.
  Hunk #4 FAILED at 223.
  4 out of 4 hunks FAILED
  ```

- `vero5-split-112-xbmc-cores-VideoPlayer-VideoRenderers-RenderSettings.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/RenderSettings.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/RenderSettings.cpp
  Hunk #1 FAILED at 42.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-113-xbmc-cores-VideoPlayer-VideoRenderers-RenderSettings.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/RenderSettings.h`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/RenderSettings.h
  Hunk #1 FAILED at 47.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-115-xbmc-cores-VideoPlayer-VideoRenderers-HwDecRender-RendererAML.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/RendererAML.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/RendererAML.cpp
  Hunk #1 FAILED at 28.
  Hunk #2 FAILED at 142.
  Hunk #3 FAILED at 198.
  Hunk #5 FAILED at 280.
  Hunk #7 FAILED at 446.
  5 out of 8 hunks FAILED
  ```

- `vero5-split-117-xbmc-cores-VideoPlayer-VideoRenderers-HwDecRender-RendererMediaCodec.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/RendererMediaCodec.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/RendererMediaCodec.cpp
  Hunk #1 FAILED at 47.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-126-xbmc-settings-Settings.cpp.patch` -> `b/xbmc/settings/Settings.cpp`

  ```text
  checking file xbmc/settings/Settings.cpp
  Hunk #1 FAILED at 58.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-129-xbmc-settings-lib-SettingDefinitions.cpp.patch` -> `b/xbmc/settings/lib/SettingDefinitions.cpp`

  ```text
  checking file xbmc/settings/lib/SettingDefinitions.cpp
  Hunk #1 FAILED at 75.
  Hunk #2 FAILED at 84.
  2 out of 2 hunks FAILED
  ```

- `vero5-split-130-xbmc-settings-lib-SettingDefinitions.h.patch` -> `b/xbmc/settings/lib/SettingDefinitions.h`

  ```text
  checking file xbmc/settings/lib/SettingDefinitions.h
  Hunk #1 FAILED at 39.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-134-xbmc-utils-AMLUtils.cpp.patch` -> `b/xbmc/utils/AMLUtils.cpp`

  ```text
  checking file xbmc/utils/AMLUtils.cpp
  Hunk #1 FAILED at 365.
  1 out of 7 hunks FAILED
  ```

- `vero5-split-147-xbmc-video-VideoDatabase.cpp.patch` -> `b/xbmc/video/VideoDatabase.cpp`

  ```text
  checking file xbmc/video/VideoDatabase.cpp
  Hunk #1 FAILED at 8097.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-150-xbmc-VideoPlayer-VideoRenderers-VideoShaders-YUV2RGBShaderGLES.cpp.patch` -> `b/xbmc/VideoPlayer/VideoRenderers/VideoShaders/YUV2RGBShaderGLES.cpp`

  ```text
  can't find file to patch at input line 5
  No file to patch.  Skipping patch.
  1 out of 1 hunk ignored
  ```

## Working split patches

The remaining 149 split patches either applied during the initial full split test or were fixed afterward and dry-run validated locally.
