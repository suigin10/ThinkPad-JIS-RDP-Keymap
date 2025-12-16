# ThinkPad JIS RDP Keymap

This tool fixes key layout issues when using a **ThinkPad JIS keyboard**
to operate a **US-layout Windows environment over RDP**.

## Features
- JIS-style symbol mapping on US RDP hosts
- Fixes number-row Shift symbols
- Keeps IME control keys untouched
- Manual toggle only (no auto-detection)
- Supports both `.exe` and `.ahk`

## Files
- `ThinkPad_JIS_RDP_Keymap_v1_3.exe`  
  Standalone executable (AutoHotkey not required)
- `ThinkPad_JIS_RDP_Keymap_v1_3.ahk`  
  Script version (AutoHotkey v1 required)
- `README_ThinkPad_JIS_RDP_Keymap_Manual.txt`  
  Detailed usage manual

## Usage
Run the tool **on the RDP host (desktop side)**.

- Toggle ON/OFF: `Ctrl + Alt + K`
- Show KeyHistory: `Ctrl + Alt + H`

## Notes
- Some keys (e.g. the top-right `\` key) are intentionally left untouched
  to avoid conflicts.
- Designed for stability rather than full remapping.

See the detailed manual for full explanation.
