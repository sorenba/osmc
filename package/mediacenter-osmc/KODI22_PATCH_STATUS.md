# Kodi 22 patch rebase status

Target source: Kodi 22 Alpha 3, `22.0a3-Piers`.

Target device: Vero 5 only.

Patch test method:

```bash
patch --batch --forward --dry-run -p1 < patchfile
patch --batch --forward -p1 < patchfile
```

Patches are tested in sorted order against a clean Kodi 22 Alpha 3 source tree, applying successful patches before testing later patches.

For patches containing git binary diffs, use:

```bash
git apply --check --binary < patchfile
git apply --binary < patchfile
```

## Completed and validated

These patches were validated with Linux `patch` against Kodi 22 Alpha 3.

- `all-000-disable-cec-toasts.patch`
  - Updated for Kodi 22 `CServiceBroker::GetResourcesComponent().GetLocalizeStrings()` calls.
  - Fixed malformed hunk headers/counts.
  - Dry-run and apply passed.

- `all-001-system-info-display.patch`
  - Applies cleanly.

- `all-003-disable-libinput-grabbing.patch`
  - Applies cleanly.

- `all-004-remove-logging-spam.patch`
  - Updated the MD5 logging hunk for Kodi 22 `CLog::LogF(...)` form.
  - Dry-run and apply passed.

- `all-012-disable-backslash-toggling-full-screen.patch`
  - Applies cleanly.

- `all-014-Sometimes-the-shutdown-or-reboot-process-can-hang.patch`
  - Moved shutdown/reboot changes from `Application.cpp` to `ApplicationMessageHandling.cpp`.
  - Added `m_ShuttingDown{false}` and `isShuttingDown() const` in `Application.h`.
  - Dry-run and apply passed.

- `all-015-Add-sigterm-handler.patch`
  - Applies cleanly after `all-014`.

- `all-019-osmc-rss-by-default.patch`
  - Updated for Kodi 22 default RSS feed layout.
  - Replaces `https://kodi.tv/feed` with `https://osmc.tv/rss/`.
  - Dry-run and apply passed.

- `all-021-allow-settings-saved-from-python.patch`
  - Applies cleanly.

- `all-022-add-hama-keymap.patch`
  - Applies cleanly.

- `all-023-do-not-handle-mounting-by-default.patch`
  - Applies cleanly.

- `all-027-no-scm-rev-in-version.patch`
  - Applies cleanly.

- `all-028-save-settings-only-if-they-were-modified.patch`
  - Applies cleanly.

- `all-029-Add-enumerated-type-OSMCSettingsState.patch`
  - Applies cleanly.

- `all-030-Add-OSMCWalkthroughState-to-CApplicationMessenger.patch`
  - Moved message handler code from `Application.cpp` to `ApplicationMessageHandling.cpp`.
  - Changed message id to `TMSG_MASK_APPLICATION + 40` because Kodi 22 uses `+39` for `TMSG_PROCESS_DELETE_AFTER_WATCH`.
  - Dry-run and apply passed.

- `all-031-Allow-OSMCWalkthroughState-to-be-set-via-xbmc-Python.patch`
  - Applies cleanly after `all-030`.

- `all-032-Allow-skin-tobe-changed-via-xbmc-legacy-Python.patch`
  - Applies cleanly.

- `all-033-Do-not-prompt-for-confirmation-of-skin-change-if-it-.patch`
  - Updated include location for Kodi 22.
  - Updated the skin reload hunk for Kodi 22 line/context changes.
  - Dry-run and apply passed.

- `all-035-Do-not-update-repositories-or-addons-while-we-are-ru.patch`
  - Applies cleanly.

- `all-041-allow-hostname-to-be-changed-via-xbmc.patch`
  - Applies cleanly.

- `all-042-allow-timezone-to-be-changed-via-xbmc.patch`
  - Applies cleanly.

- `all-044-Use-UDevil-to-unmount-disks-if-it-is-available.patch`
  - Applies cleanly.

- `all-045-Do-not-show-boot-in-list-of-mounted-media.patch`
  - Applies cleanly.

- `all-060-disable-event-logging-by-default.patch`
  - Applies cleanly.

- `all-070-no-version-check-in-manifest.patch`
  - Applies cleanly.

- `all-073-enable-expert-settings-by-default.patch`
  - Applies cleanly.

- `all-077-Fix-an-issue-when-passing-multiple-addons-to-ADDONS_.patch`
  - Applies cleanly.

- `all-087-make-osmc-skin-default.patch`
  - Applies cleanly.

- `all-090-do-not-notify-when-boot-is-mounted.patch`
  - Applies cleanly.

- `all-099-fix-for-iptv-blocking-osmc.patch`
  - Applies cleanly.

- `all-100-ensure-web-server-on-port-80.patch`
  - Applies cleanly.

- `all-107-ensure-some-addons-always-enabled-at-startup.patch`
  - Applies cleanly.

- `all-112-allow-sharing-for-mounted-disks.patch`
  - Applies cleanly.

- `all-114-set-system-defaults-for-osmc.patch`
  - Applies cleanly.

- `all-117-use-osmc-binary-addon-repo.patch`
  - Updated for Kodi 22 `Piers` binary add-on branch.
  - Dry-run validation still needed in a clean Kodi 22 Alpha 3 tree.

- `all-122-add-support-for-osmc-long-press.patch`
  - Applies cleanly.

- `all-123-add-support-for-bluealsa.patch`
  - Applies cleanly.

- `all-125-fix-quirky-USB-audio-card.patch`
  - Applies cleanly.

- `all-127-improve-CEC-behaviour.patch`
  - Applies cleanly.

- `all-130-fix-no-git-found.patch`
  - Applies cleanly.

- `all-131-change-input-delay.patch`
  - Applies cleanly.

- `all-134-add-bdj-keymap.patch`
  - Applies cleanly.

- `all-999-use-older-libfmt.patch`
  - Rebasing reduced this to the remaining Kodi 22-relevant `fmt/xchar.h` include removal.
  - Dry-run validation still needed in a clean Kodi 22 Alpha 3 tree.

- `vero5-000-add-vero-support.patch`
  - Required for target device.
  - Fixed and regenerated from `package/mediacenter-osmc/patches/vero5-split/` using `package/mediacenter-osmc/tools/combine-vero5-splits.py`.
  - Dry-run validated cleanly against a fresh Kodi 22 Alpha 3 tree.

## Remaining failures / needs rebase

These patches still need work for Kodi 22 Alpha 3.

- `all-007-sync-timezone-from-mediacenter.patch`
  - Fails because `xbmc/platform/posix/PosixTimezone.cpp` no longer exists in Kodi 22.
  - Need to identify the new timezone handling path, or skip if obsolete.

- `all-040-Ensure-that-Kodi-devicename-reflects-etc-hostname.patch`
  - Fails in `SystemGUIInfo.cpp` and `NetworkServices.cpp`.

- `all-086-add-osmc-privacy-policy.patch`
  - Fails because `privacy-policy.txt` already exists before the add half of the patch.
  - Needs review as a two-part delete/add patch.

- `all-092-fix-skin-saving-settings.patch`
  - Fails in `SkinSettings.cpp`.

- `all-093-fix-setting-loss-when-rebooting-from-profile-login-screen.patch`
  - Fails in `Application.cpp`.
  - Likely needs migration to `ApplicationMessageHandling.cpp`, similar to `all-014`.

- `all-094-fix-setting-loss-when-rebooting-from-Kodi.patch`
  - Reported as reversed or previously applied during the current sequence.
  - Needs review after `all-093` is rebased.

- `all-113-add-support-to-mix-LFE.patch`
  - Settings hunk applies with fuzz.
  - Fails in `ActiveAEResampleFFMPEG.cpp`.

- `all-119-fix-playback-of-m3u-internet-streams.patch`
  - Fails in `PlayListFactory.cpp`.

- `all-121-prefer-higher-res-at-framerate.patch`
  - Fails in `DisplaySettings.cpp`.
  - Other hunks in `Variant.*` and `Resolution.cpp` apply.

- `all-128-allow-downstream-strings.patch`
  - Fails in `LanguageResource.cpp`.
  - Also references `xbmc/guilib/LocalizeStrings.cpp`, which no longer exists at that path.

- `all-129-support-string-override.patch`
  - References `xbmc/guilib/LocalizeStrings.cpp`, which no longer exists at that path.

- `all-132-fix-skin-reloading-crash.patch`
  - Fails first hunk in `ApplicationSkinHandling.cpp`.
  - Other hunk applies.

## Binary patches needing git-aware validation

These fail under plain Linux `patch` because git binary diffs are not supported by `patch`. They need validation with `git apply` or during the real OSMC build patch step.

- `all-063-update-favicon-for-kodi-web-interface.patch`
- `all-074-add-my-osmc-to-estuary.patch`
- `all-999-fix-jre-bullseye.patch`

## Skipped by scope

These are out of scope for this Kodi 22 Vero 5 build.

- `rbp-*.patch`
  - Skipped. Raspberry Pi is not a target.

- `vero3-*.patch`
  - Skipped. Vero 3 is not a target.

- Non-English `resource.language.*` addon copies/downloads
  - Skipped. Keep English only for this build.

- Other non-Vero 5 device-specific work
  - Skipped. Vero 5 only.
