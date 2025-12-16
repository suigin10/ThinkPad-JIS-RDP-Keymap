
; =========================================================
; ThinkPad JIS → US RDP Keymap v1.4
;
; Modes
; - FIX OFF (US mode) [default on startup]
;     * Tray icon = US (blue)
;     * Alt-IME behavior enabled:
;         - Tap Left Alt  : EISU (英数)  via Muhenkan (vk1D)
;         - Tap Right Alt : KANA (日本語) via Henkan  (vk1C)
;       (Only triggers when Alt is tapped alone; Alt+Tab etc. still works.)
; - FIX ON  (JA mode)
;     * Tray icon = JA (red)
;     * JIS→US RDP symbol fixes enabled
;
; Hotkeys
; - Ctrl + Alt + K : Toggle FIX ON/OFF
; - Ctrl + Alt + H : KeyHistory
;
; Files (for .ahk run)
; - icon_US_blue.ico
; - icon_JA_red.ico
; =========================================================

#NoEnv
#SingleInstance Force
SendMode Input
#InstallKeybdHook
#UseHook On
#MenuMaskKey vk07
SetWorkingDir %A_ScriptDir%

FixOn = 0  ; start disabled (US mode)

; ---------- Icon path handling (works for .ahk and compiled .exe) ----------
if A_IsCompiled
{
    JA_ICO := A_Temp "\ThinkPad_JIS_RDP_JA.ico"
    US_ICO := A_Temp "\ThinkPad_JIS_RDP_US.ico"
    FileInstall, icon_JA_red.ico, %JA_ICO%, 1
    FileInstall, icon_US_blue.ico, %US_ICO%, 1
}
else
{
    JA_ICO := A_ScriptDir "\icon_JA_red.ico"
    US_ICO := A_ScriptDir "\icon_US_blue.ico"
}

Gosub, SetTrayByFix

; ---------- Hotkeys ----------
^!k::
FixOn := !FixOn
Gosub, SetTrayByFix
ToolTip, % FixOn ? "FIX ON (JA)" : "FIX OFF (US)"
SetTimer, HideTip, -900
return

^!h::
KeyHistory
return

HideTip:
ToolTip
return

SetTrayByFix:
if FixOn
    Menu, Tray, Icon, %JA_ICO%
else
    Menu, Tray, Icon, %US_ICO%
return

; =========================================================
; Alt-IME behavior (active ONLY when FIX OFF / US mode)
; =========================================================
#If (!FixOn)

~*LAlt Up::
if (A_PriorKey = "LAlt" || A_PriorKey = "Alt")
{
    ; prevent menu/toolbar focus stealing
    SendInput, {vk07}{Esc}
    ; EISU (英数) - relies on Google IME setting for Muhenkan
    SendInput, {vk1D}
}
return

~*RAlt Up::
if (A_PriorKey = "RAlt" || A_PriorKey = "Alt")
{
    SendInput, {vk07}{Esc}
    ; KANA (日本語) - relies on Google IME setting for Henkan
    SendInput, {vk1C}
}
return

#If

; =========================================================
; JIS → US RDP symbol fixes (active ONLY when FIX ON / JA mode)
; =========================================================
#If FixOn

; ---------- IME control keys (PASS THROUGH) ----------
$SC029::SendInput, {Blind}{vkF3}  ; 半角/全角
$SC07B::SendInput, {Blind}{vk1D}  ; 無変換
$SC079::SendInput, {Blind}{vk1C}  ; 変換
$SC070::SendInput, {Blind}{vkF2}  ; ひらがな/カタカナ

; ---------- Number row Shift symbols (JIS) ----------
$+SC003::SendInput, {ASC 34}      ; Shift+2 -> "
$+SC007::SendRaw, &               ; Shift+6 -> &
$+SC008::SendRaw, '               ; Shift+7 -> '
$+SC00C::SendRaw, =               ; Shift+- -> =

; ---------- JIS symbol cluster ----------
$SC01A::SendRaw, @
$+SC01A::SendInput, {ASC 96}      ; Shift+@ -> `

$SC01B::SendRaw, [
$+SC01B::SendRaw, {

$SC02B::SendRaw, ]
$+SC02B::SendRaw, }

$SC027::SendRaw, `;               ; semicolon must be escaped
$+SC027::SendRaw, +

$SC028::SendRaw, :
$+SC028::SendRaw, *

$SC073::SendRaw, \
$+SC073::SendRaw, _

$SC00D::SendRaw, ^
$+SC00D::SendRaw, ~

; ---------- Parentheses (JIS) ----------
$+SC009::SendRaw, (
$+SC00A::SendRaw, )
$+SC00B::SendRaw, 0

#If
