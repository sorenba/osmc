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
Working split patches: 144
Needs work: 29

## Needs work

- `vero5-split-002-cmake-modules-FindFFMPEG.cmake.patch` -> `b/cmake/modules/FindFFMPEG.cmake`

  ```text
  checking file cmake/modules/FindFFMPEG.cmake
  Hunk #1 FAILED at 80.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-010-system-settings-settings.xml.patch` -> `b/system/settings/settings.xml`

  ```text
  checking file system/settings/settings.xml
  Hunk #3 FAILED at 2637.
  Hunk #4 FAILED at 2645.
  Hunk #7 FAILED at 3181.
  3 out of 14 hunks FAILED
  ```

- `vero5-split-019-xbmc-application-Application.cpp.patch` -> `b/xbmc/application/Application.cpp`

  ```text
  checking file xbmc/application/Application.cpp
  Hunk #1 FAILED at 139.
  Hunk #3 FAILED at 1605.
  2 out of 5 hunks FAILED
  ```

- `vero5-split-025-xbmc-cores-AudioEngine-Sinks-AESinkAUDIOTRACK.cpp.patch` -> `b/xbmc/cores/AudioEngine/Sinks/AESinkAUDIOTRACK.cpp`

  ```text
  checking file xbmc/cores/AudioEngine/Sinks/AESinkAUDIOTRACK.cpp
  Hunk #7 FAILED at 1171.
  1 out of 9 hunks FAILED
  ```

- `vero5-split-028-xbmc-cores-RetroPlayer-process-RPProcessInfo.h.patch` -> `b/xbmc/cores/RetroPlayer/process/RPProcessInfo.h`

  ```text
  checking file xbmc/cores/RetroPlayer/process/RPProcessInfo.h
  Hunk #1 FAILED at 146.
  1 out of 1 hunk FAILED
  ```

- `vero5-split-036-xbmc-cores-VideoPlayer-DVDCodecs-Overlay-DVDOverlayCodecFFmpeg.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Overlay/DVDOverlayCodecFFmpeg.cpp`

  ```text
  checking file xbmc/cores/VideoPlayer/DVDCodecs/Overlay/DVDOverlayCodecFFmpeg.cpp
  Reversed (or previously applied) patch detected!  Skipping patch.
  1 out of 1 hunk ignored
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

- `vero5-split-001-cmake-modules-FindAML.cmake.patch` -> `b/cmake/modules/FindAML.cmake`
- `vero5-split-003-cmake-platform-linux-aml.cmake.patch` -> `b/cmake/platform/linux/aml.cmake`
- `vero5-split-004-cmake-scripts-android-ArchSetup.cmake.patch` -> `b/cmake/scripts/android/ArchSetup.cmake`
- `vero5-split-005-cmake-scripts-common-ArchSetup.cmake.patch` -> `b/cmake/scripts/common/ArchSetup.cmake`
- `vero5-split-006-cmake-scripts-common-Platform.cmake.patch` -> `b/cmake/scripts/common/Platform.cmake`
- `vero5-split-007-cmake-treedata-common-aml-aml.txt.patch` -> `b/cmake/treedata/common/aml/aml.txt`
- `vero5-split-008-system-keymaps-remote.xml.patch` -> `b/system/keymaps/remote.xml`
- `vero5-split-009-system-settings-linux.xml.patch` -> `b/system/settings/linux.xml`
- `vero5-split-011-tools-depends-target-ffmpeg-0001-added_upstream_mvc_patches.patch.patch` -> `b/tools/depends/target/ffmpeg/0001-added_upstream_mvc_patches.patch`
- `vero5-split-012-tools-depends-target-ffmpeg-0002-MKV-added-basic-block-addition-mapping-support-for-m.patch.patch` -> `b/tools/depends/target/ffmpeg/0002-MKV-added-basic-block-addition-mapping-support-for-m.patch`
- `vero5-split-013-tools-depends-target-ffmpeg-CMakeLists.txt.patch` -> `b/tools/depends/target/ffmpeg/CMakeLists.txt`
- `vero5-split-014-tools-depends-target-libamcodec-0001-Disable-dolby-pthread.patch.patch` -> `b/tools/depends/target/libamcodec/0001-Disable-dolby-pthread.patch`
- `vero5-split-015-tools-depends-target-libamcodec-AMLCodec-GrabData.c.patch` -> `b/tools/depends/target/libamcodec/AMLCodec/GrabData.c`
- `vero5-split-016-tools-depends-target-libamcodec-CMakeLists.txt.patch` -> `b/tools/depends/target/libamcodec/CMakeLists.txt`
- `vero5-split-017-tools-depends-target-libamcodec-Makefile.patch` -> `b/tools/depends/target/libamcodec/Makefile`
- `vero5-split-018-version.txt.patch` -> `b/version.txt`
- `vero5-split-020-xbmc-application-ApplicationComponents.cpp.patch` -> `b/xbmc/application/ApplicationComponents.cpp`
- `vero5-split-021-xbmc-application-ApplicationPlayer.cpp.patch` -> `b/xbmc/application/ApplicationPlayer.cpp`
- `vero5-split-022-xbmc-cores-AudioEngine-AEFactory.cpp.patch` -> `b/xbmc/cores/AudioEngine/AEFactory.cpp`
- `vero5-split-023-xbmc-cores-AudioEngine-Interfaces-AE.h.patch` -> `b/xbmc/cores/AudioEngine/Interfaces/AE.h`
- `vero5-split-024-xbmc-cores-AudioEngine-Sinks-AESinkALSA.cpp.patch` -> `b/xbmc/cores/AudioEngine/Sinks/AESinkALSA.cpp`
- `vero5-split-026-xbmc-cores-AudioEngine-Sinks-AESinkAUDIOTRACK.h.patch` -> `b/xbmc/cores/AudioEngine/Sinks/AESinkAUDIOTRACK.h`
- `vero5-split-027-xbmc-cores-AudioEngine-Sinks-AESinkPipewire.cpp.patch` -> `b/xbmc/cores/AudioEngine/Sinks/AESinkPipewire.cpp`
- `vero5-split-029-xbmc-cores-RetroPlayer-process-amlogic-RPProcessInfoAmlogic.cpp.patch` -> `b/xbmc/cores/RetroPlayer/process/amlogic/RPProcessInfoAmlogic.cpp`
- `vero5-split-030-xbmc-cores-RetroPlayer-process-amlogic-RPProcessInfoAmlogic.h.patch` -> `b/xbmc/cores/RetroPlayer/process/amlogic/RPProcessInfoAmlogic.h`
- `vero5-split-031-xbmc-cores-VideoPlayer-VideoPlayer.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoPlayer.cpp`
- `vero5-split-032-xbmc-cores-VideoPlayer-VideoPlayer.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoPlayer.h`
- `vero5-split-033-xbmc-cores-VideoPlayer-CMakeLists.txt.patch` -> `b/xbmc/cores/VideoPlayer/CMakeLists.txt`
- `vero5-split-034-xbmc-cores-VideoPlayer-DVDCodecs-Video-VAAPI.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VAAPI.cpp`
- `vero5-split-035-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoCodec.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoCodec.h`
- `vero5-split-037-xbmc-cores-VideoPlayer-DVDCodecs-Video-AddonVideoCodec.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/AddonVideoCodec.cpp`
- `vero5-split-038-xbmc-cores-VideoPlayer-DVDCodecs-Video-AddonVideoCodec.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/AddonVideoCodec.h`
- `vero5-split-039-xbmc-cores-VideoPlayer-DVDCodecs-Video-CMakeLists.txt.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/CMakeLists.txt`
- `vero5-split-040-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodec.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodec.cpp`
- `vero5-split-041-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodec.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodec.h`
- `vero5-split-042-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecAmlogic.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecAmlogic.cpp`
- `vero5-split-043-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecAmlogic.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecAmlogic.h`
- `vero5-split-044-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecDRMPRIME.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecDRMPRIME.cpp`
- `vero5-split-045-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecDRMPRIME.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecDRMPRIME.h`
- `vero5-split-046-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecDRMPRIMEFFmpeg.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecDRMPRIMEFFmpeg.cpp`
- `vero5-split-047-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecDRMPRIMEFFmpeg.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecDRMPRIMEFFmpeg.h`
- `vero5-split-048-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecFFmpeg.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp`
- `vero5-split-049-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecFFmpeg.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h`
- `vero5-split-050-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecIMX.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecIMX.cpp`
- `vero5-split-051-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecIMX.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecIMX.h`
- `vero5-split-052-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecStarfish.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecStarfish.cpp`
- `vero5-split-053-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecStarfish.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecStarfish.h`
- `vero5-split-054-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecVideoToolBox.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecVideoToolBox.cpp`
- `vero5-split-055-xbmc-cores-VideoPlayer-DVDCodecs-Video-DVDVideoCodecVideoToolBox.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/DVDVideoCodecVideoToolBox.h`
- `vero5-split-056-xbmc-cores-VideoPlayer-DVDCodecs-Video-MMALCodec.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/MMALCodec.cpp`
- `vero5-split-057-xbmc-cores-VideoPlayer-DVDCodecs-Video-MMALCodec.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/MMALCodec.h`
- `vero5-split-058-xbmc-cores-VideoPlayer-DVDCodecs-Video-OpenMax.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/OpenMax.cpp`
- `vero5-split-059-xbmc-cores-VideoPlayer-DVDCodecs-Video-OpenMax.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/OpenMax.h`
- `vero5-split-060-xbmc-cores-VideoPlayer-DVDCodecs-Video-VAAPI.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VAAPI.h`
- `vero5-split-061-xbmc-cores-VideoPlayer-DVDCodecs-Video-VDPAU.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VDPAU.cpp`
- `vero5-split-062-xbmc-cores-VideoPlayer-DVDCodecs-Video-VDPAU.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VDPAU.h`
- `vero5-split-063-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBuffer.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBuffer.cpp`
- `vero5-split-064-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBuffer.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBuffer.h`
- `vero5-split-065-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferDMA.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferDMA.cpp`
- `vero5-split-066-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferDMA.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferDMA.h`
- `vero5-split-067-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferDRMPRIME.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferDRMPRIME.cpp`
- `vero5-split-068-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferDRMPRIME.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferDRMPRIME.h`
- `vero5-split-069-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferIMX.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferIMX.cpp`
- `vero5-split-070-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferIMX.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferIMX.h`
- `vero5-split-071-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferStarfish.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferStarfish.cpp`
- `vero5-split-072-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferStarfish.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferStarfish.h`
- `vero5-split-073-xbmc-cores-VideoPlayer-DVDCodecs-Video-VideoBufferVideoToolBox.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDCodecs/Video/VideoBufferVideoToolBox.cpp`
- `vero5-split-075-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemuxClient.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemuxClient.cpp`
- `vero5-split-077-xbmc-cores-VideoPlayer-DVDDemuxers-DVDDemuxVobsub.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemuxVobsub.cpp`
- `vero5-split-078-xbmc-cores-VideoPlayer-DVDDemuxers-DVDFactoryDemuxer.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDFactoryDemuxer.cpp`
- `vero5-split-079-xbmc-cores-VideoPlayer-DVDDemuxers-DVDFactoryDemuxer.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDFactoryDemuxer.h`
- `vero5-split-080-xbmc-cores-VideoPlayer-DVDDemuxers-DVDFactoryInputStream.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDFactoryInputStream.cpp`
- `vero5-split-081-xbmc-cores-VideoPlayer-DVDDemuxers-DVDInputStreamNavigator.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDInputStreamNavigator.cpp`
- `vero5-split-082-xbmc-cores-VideoPlayer-DVDDemuxers-DVDInputStreamNavigator.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DVDInputStreamNavigator.h`
- `vero5-split-083-xbmc-cores-VideoPlayer-DVDDemuxers-DemuxMultiSource.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DemuxMultiSource.cpp`
- `vero5-split-084-xbmc-cores-VideoPlayer-DVDDemuxers-DemuxMultiSource.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDDemuxers/DemuxMultiSource.h`
- `vero5-split-087-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamBluray.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamBluray.cpp`
- `vero5-split-088-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamBluray.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamBluray.h`
- `vero5-split-093-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamNavigator.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamNavigator.cpp`
- `vero5-split-094-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamNavigator.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamNavigator.h`
- `vero5-split-095-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamPVRManager.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamPVRManager.cpp`
- `vero5-split-096-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamPVRManager.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamPVRManager.h`
- `vero5-split-097-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamStack.cpp.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamStack.cpp`
- `vero5-split-098-xbmc-cores-VideoPlayer-DVDInputStreams-DVDInputStreamStack.h.patch` -> `b/xbmc/cores/VideoPlayer/DVDInputStreams/DVDInputStreamStack.h`
- `vero5-split-099-xbmc-cores-VideoPlayer-Process-ProcessInfo.cpp.patch` -> `b/xbmc/cores/VideoPlayer/Process/ProcessInfo.cpp`
- `vero5-split-100-xbmc-cores-VideoPlayer-Process-ProcessInfo.h.patch` -> `b/xbmc/cores/VideoPlayer/Process/ProcessInfo.h`
- `vero5-split-102-xbmc-cores-VideoPlayer-VideoPlayerAudio.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoPlayerAudio.cpp`
- `vero5-split-103-xbmc-cores-VideoPlayer-VideoPlayerVideo.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoPlayerVideo.cpp`
- `vero5-split-104-xbmc-cores-VideoPlayer-VideoPlayerVideo.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoPlayerVideo.h`
- `vero5-split-107-xbmc-cores-VideoPlayer-VideoRenderers-OverlayRendererUtil.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/OverlayRendererUtil.cpp`
- `vero5-split-108-xbmc-cores-VideoPlayer-VideoRenderers-OverlayRendererUtil.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/OverlayRendererUtil.h`
- `vero5-split-109-xbmc-cores-VideoPlayer-VideoRenderers-RenderFlags.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/RenderFlags.cpp`
- `vero5-split-114-xbmc-cores-VideoPlayer-VideoRenderers-VideoShaders-YUV2RGBShaderGLES.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/VideoShaders/YUV2RGBShaderGLES.cpp`
- `vero5-split-116-xbmc-cores-VideoPlayer-VideoRenderers-HwDecRender-RendererAML.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/RendererAML.h`
- `vero5-split-118-xbmc-cores-VideoPlayer-VideoRenderers-VideoShaders-YUV2RGBShaderGLES.cpp.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/VideoShaders/YUV2RGBShaderGLES.cpp`
- `vero5-split-119-xbmc-cores-VideoPlayer-VideoRenderers-VideoShaders-YUV2RGBShaderGLES.h.patch` -> `b/xbmc/cores/VideoPlayer/VideoRenderers/VideoShaders/YUV2RGBShaderGLES.h`
- `vero5-split-120-xbmc-filesystem-iso9660.cpp.patch` -> `b/xbmc/filesystem/iso9660.cpp`
- `vero5-split-121-xbmc-guilib-StereoscopicsManager.cpp.patch` -> `b/xbmc/guilib/StereoscopicsManager.cpp`
- `vero5-split-122-xbmc-guilib-VideoGUIInfo.cpp.patch` -> `b/xbmc/guilib/VideoGUIInfo.cpp`
- `vero5-split-123-xbmc-guilib-VideoGUIInfo.h.patch` -> `b/xbmc/guilib/VideoGUIInfo.h`
- `vero5-split-124-xbmc-interfaces-legacy-InfoTagVideo.cpp.patch` -> `b/xbmc/interfaces/legacy/InfoTagVideo.cpp`
- `vero5-split-125-xbmc-interfaces-legacy-InfoTagVideo.h.patch` -> `b/xbmc/interfaces/legacy/InfoTagVideo.h`
- `vero5-split-127-xbmc-settings-SettingsComponent.cpp.patch` -> `b/xbmc/settings/SettingsComponent.cpp`
- `vero5-split-128-xbmc-settings-Settings.h.patch` -> `b/xbmc/settings/Settings.h`
- `vero5-split-131-xbmc-threads-platform-linux-ThreadImpl.cpp.patch` -> `b/xbmc/threads/platform/linux/ThreadImpl.cpp`
- `vero5-split-132-xbmc-threads-platform-pthreads-ThreadImpl.cpp.patch` -> `b/xbmc/threads/platform/pthreads/ThreadImpl.cpp`
- `vero5-split-133-xbmc-threads-platform-win-ThreadImpl.cpp.patch` -> `b/xbmc/threads/platform/win/ThreadImpl.cpp`
- `vero5-split-135-xbmc-utils-AMLUtils.h.patch` -> `b/xbmc/utils/AMLUtils.h`
- `vero5-split-136-xbmc-utils-EGLImage.cpp.patch` -> `b/xbmc/utils/EGLImage.cpp`
- `vero5-split-137-xbmc-utils-EGLImage.h.patch` -> `b/xbmc/utils/EGLImage.h`
- `vero5-split-138-xbmc-utils-HDRCapabilities.cpp.patch` -> `b/xbmc/utils/HDRCapabilities.cpp`
- `vero5-split-139-xbmc-utils-HDRCapabilities.h.patch` -> `b/xbmc/utils/HDRCapabilities.h`
- `vero5-split-140-xbmc-utils-MemUtils.cpp.patch` -> `b/xbmc/utils/MemUtils.cpp`
- `vero5-split-141-xbmc-utils-StreamUtils.cpp.patch` -> `b/xbmc/utils/StreamUtils.cpp`
- `vero5-split-142-xbmc-utils-StreamUtils.h.patch` -> `b/xbmc/utils/StreamUtils.h`
- `vero5-split-143-xbmc-video-Bookmark.h.patch` -> `b/xbmc/video/Bookmark.h`
- `vero5-split-144-xbmc-video-VideoDatabase.h.patch` -> `b/xbmc/video/VideoDatabase.h`
- `vero5-split-145-xbmc-video-VideoDatabaseFile.cpp.patch` -> `b/xbmc/video/VideoDatabaseFile.cpp`
- `vero5-split-146-xbmc-video-VideoDatabaseFile.h.patch` -> `b/xbmc/video/VideoDatabaseFile.h`
- `vero5-split-148-xbmc-VideoPlayer-VideoRenderers-HwDecRender-RendererAML.cpp.patch` -> `b/xbmc/VideoPlayer/VideoRenderers/HwDecRender/RendererAML.cpp`
- `vero5-split-149-xbmc-VideoPlayer-VideoRenderers-HwDecRender-RendererAML.h.patch` -> `b/xbmc/VideoPlayer/VideoRenderers/HwDecRender/RendererAML.h`
- `vero5-split-151-xbmc-windowing-amlogic-AMLDisplaySettings.cpp.patch` -> `b/xbmc/windowing/amlogic/AMLDisplaySettings.cpp`
- `vero5-split-152-xbmc-windowing-amlogic-AMLDisplaySettings.h.patch` -> `b/xbmc/windowing/amlogic/AMLDisplaySettings.h`
- `vero5-split-153-xbmc-windowing-amlogic-AMLUtils.cpp.patch` -> `b/xbmc/windowing/amlogic/AMLUtils.cpp`
- `vero5-split-154-xbmc-windowing-amlogic-AMLUtils.h.patch` -> `b/xbmc/windowing/amlogic/AMLUtils.h`
- `vero5-split-155-xbmc-windowing-amlogic-CMakeLists.txt.patch` -> `b/xbmc/windowing/amlogic/CMakeLists.txt`
- `vero5-split-156-xbmc-windowing-amlogic-DolbyVision.cpp.patch` -> `b/xbmc/windowing/amlogic/DolbyVision.cpp`
- `vero5-split-157-xbmc-windowing-amlogic-DolbyVision.h.patch` -> `b/xbmc/windowing/amlogic/DolbyVision.h`
- `vero5-split-158-xbmc-windowing-amlogic-OptionalsReg.cpp.patch` -> `b/xbmc/windowing/amlogic/OptionalsReg.cpp`
- `vero5-split-159-xbmc-windowing-amlogic-OSScreenSaverAmlogic.cpp.patch` -> `b/xbmc/windowing/amlogic/OSScreenSaverAmlogic.cpp`
- `vero5-split-160-xbmc-windowing-amlogic-OSScreenSaverAmlogic.h.patch` -> `b/xbmc/windowing/amlogic/OSScreenSaverAmlogic.h`
- `vero5-split-161-xbmc-windowing-amlogic-OSScreenSaverFreedesktop.cpp.patch` -> `b/xbmc/windowing/amlogic/OSScreenSaverFreedesktop.cpp`
- `vero5-split-162-xbmc-windowing-amlogic-OSScreenSaverFreedesktop.h.patch` -> `b/xbmc/windowing/amlogic/OSScreenSaverFreedesktop.h`
- `vero5-split-163-xbmc-windowing-amlogic-OptionalsReg.h.patch` -> `b/xbmc/windowing/amlogic/OptionalsReg.h`
- `vero5-split-164-xbmc-windowing-amlogic-VideoSyncAML.cpp.patch` -> `b/xbmc/windowing/amlogic/VideoSyncAML.cpp`
- `vero5-split-165-xbmc-windowing-amlogic-VideoSyncDRM.cpp.patch` -> `b/xbmc/windowing/amlogic/VideoSyncDRM.cpp`
- `vero5-split-166-xbmc-windowing-amlogic-VideoSyncDRM.h.patch` -> `b/xbmc/windowing/amlogic/VideoSyncDRM.h`
- `vero5-split-167-xbmc-windowing-amlogic-VideoSyncGbm.cpp.patch` -> `b/xbmc/windowing/amlogic/VideoSyncGbm.cpp`
- `vero5-split-168-xbmc-windowing-amlogic-VideoSyncGbm.h.patch` -> `b/xbmc/windowing/amlogic/VideoSyncGbm.h`
- `vero5-split-169-xbmc-windowing-amlogic-VideoSyncAML.h.patch` -> `b/xbmc/windowing/amlogic/VideoSyncAML.h`
- `vero5-split-170-xbmc-windowing-amlogic-WinSystemAmlogic.cpp.patch` -> `b/xbmc/windowing/amlogic/WinSystemAmlogic.cpp`
- `vero5-split-171-xbmc-windowing-amlogic-WinSystemAmlogic.h.patch` -> `b/xbmc/windowing/amlogic/WinSystemAmlogic.h`
- `vero5-split-172-xbmc-windowing-amlogic-WinSystemAmlogicGLESContext.cpp.patch` -> `b/xbmc/windowing/amlogic/WinSystemAmlogicGLESContext.cpp`
- `vero5-split-173-xbmc-windowing-amlogic-WinSystemAmlogicGLESContext.h.patch` -> `b/xbmc/windowing/amlogic/WinSystemAmlogicGLESContext.h`
