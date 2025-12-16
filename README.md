# ThinkPad JIS → US RDP Keymap

A small utility for using a **ThinkPad Japanese (JIS) keyboard**
comfortably on a **US-layout Windows environment over RDP**.

It fixes symbol layout mismatches and provides an Alt-IME style
input switch that works reliably even in RDP sessions.

## Features
- Safe default startup in US mode
- Tray icon shows current mode (US / JA)
- JIS-to-US symbol correction when enabled
- alt-ime-ahk style input switching (US mode only)
  - Left Alt  = English (EISU)
  - Right Alt = Japanese (KANA)
- Normal Alt shortcuts (Alt+Tab, Alt+F4, menus) are preserved
- Available as both `.ahk` script and compiled `.exe`

Tested on Windows 10 / 11 with Google IME.

### Note for AHK users
If you run the `.ahk` script directly, place
`icon_US_blue.ico` and `icon_JA_red.ico`
in the same folder as the script.
They are used for tray icon switching.

---

# ThinkPad JIS → US RDP Keymap

本ツールは、**ThinkPadの日本語(JIS)キーボード**で  
**US配列として動作するRDP先Windows**を  
快適に操作するための小さなユーティリティです。

記号配列のズレを補正し、RDP環境でも安定して動作する  
alt-ime-ahk風の入力切替を提供します。

## 主な機能
- 起動時は安全なUSモード
- トレイアイコンで現在のモードを表示（US / JA）
- 有効時にJIS→USの記号配置を補正
- USモード時のみ Alt-IME風入力切替
  - 左Alt ＝ 英数
  - 右Alt ＝ 日本語
- Alt+Tab / Alt+F4 / メニュー操作は通常通り動作
- AHK版 / EXE版の両方に対応

Windows 10 / 11 + Google IME 環境で動作確認済みです。

### AHK版を使う方へ
`.ahk` を直接実行する場合は、
`icon_US_blue.ico` と `icon_JA_red.ico` を
スクリプトと同じフォルダに置いてください。
トレイアイコン切替に使用されます。
