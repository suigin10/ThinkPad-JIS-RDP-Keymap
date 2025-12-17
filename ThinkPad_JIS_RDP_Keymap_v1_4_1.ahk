
; =========================================================
; ThinkPad JIS → US RDP Keymap v1.4.1
; =========================================================

#NoEnv
#SingleInstance Force
SendMode Input
#InstallKeybdHook
#UseHook On
#MenuMaskKey vk07
SetWorkingDir %A_ScriptDir%

FixOn := 0  ; start in US mode

; ----- icon handling -----
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

Gosub, SetTray

; ----- hotkeys -----
^!k::
FixOn := !FixOn
Gosub, SetTray
ToolTip, % FixOn ? "FIX ON (JA)" : "FIX OFF (US)"
SetTimer, HideTip, -800
return

HideTip:
ToolTip
return

SetTray:
if FixOn
    Menu, Tray, Icon, %JA_ICO%
else
    Menu, Tray, Icon, %US_ICO%
return

; =========================================================
; Alt-IME (US mode only)
; =========================================================
#If (!FixOn)

~*LAlt Up::
if (A_PriorKey = "LAlt" || A_PriorKey = "Alt")
    SendInput, {vk1D}   ; 英数（無変換）
return

~*RAlt Up::
if (A_PriorKey = "RAlt" || A_PriorKey = "Alt")
    SendInput, {vk1C}   ; 日本語（変換）
return

#If

; =========================================================
; JIS → US symbol fixes (JA mode only)
; =========================================================
#If FixOn

$SC029::SendInput, {vkF3}
$SC07B::SendInput, {vk1D}
$SC079::SendInput, {vk1C}
$SC070::SendInput, {vkF2}

$+SC003::SendInput, {ASC 34}
$+SC007::SendRaw, &
$+SC008::SendRaw, '
$+SC00C::SendRaw, =

$SC01A::SendRaw, @
$+SC01A::SendInput, {ASC 96}

$SC01B::SendRaw, [
$+SC01B::SendRaw, {

$SC02B::SendRaw, ]
$+SC02B::SendRaw, }

$SC027::SendRaw, `;
$+SC027::SendRaw, +

$SC028::SendRaw, :
$+SC028::SendRaw, *

$SC073::SendRaw, \
$+SC073::SendRaw, _

$SC00D::SendRaw, ^
$+SC00D::SendRaw, ~

$+SC009::SendRaw, (
$+SC00A::SendRaw, )

#If
