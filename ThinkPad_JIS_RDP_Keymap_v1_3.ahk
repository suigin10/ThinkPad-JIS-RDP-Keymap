
; =========================================================
; ThinkPad JIS → US RDP Keymap Final v1.3
; Change:
; - Auto-detect REMOVED (was causing false triggers)
; - FIX is ON at startup
; - Manual toggle only (Ctrl+Alt+K)
; =========================================================

#NoEnv
#SingleInstance Force
SendMode Input
#InstallKeybdHook
#UseHook On

FixOn = 1   ; start enabled

^!k::
if FixOn = 1
{
    FixOn = 0
    ToolTip, FIX OFF
}
else
{
    FixOn = 1
    ToolTip, FIX ON
}
SetTimer, HideTip, -800
return

^!h::
KeyHistory
return

HideTip:
ToolTip
return

DoSend:
SendRaw, %SendStr%
return

#If FixOn

; ---------- IME control keys (PASS THROUGH) ----------
$SC029::SendInput, {Blind}{vkF3}
$SC07B::SendInput, {Blind}{vk1D}
$SC079::SendInput, {Blind}{vk1C}
$SC070::SendInput, {Blind}{vkF2}

; ---------- Number row Shift symbols -> JIS ----------
$+SC003::SendInput, {ASC 34}   ; Shift+2 -> "
$+SC007::
SendStr = &
Gosub, DoSend
return
$+SC008::
SendStr = '
Gosub, DoSend
return
$+SC00C::
SendStr = =
Gosub, DoSend
return

; ---------- JIS symbol cluster ----------
$SC01A::
SendStr = @
Gosub, DoSend
return
$+SC01A::SendInput, {ASC 96}

$SC01B::
SendStr = [
Gosub, DoSend
return
$+SC01B::
SendStr = {
Gosub, DoSend
return

$SC02B::
SendStr = ]
Gosub, DoSend
return
$+SC02B::
SendStr = }
Gosub, DoSend
return

$SC027::
SendStr = `;
Gosub, DoSend
return
$+SC027::
SendStr = +
Gosub, DoSend
return

$SC028::
SendStr = :
Gosub, DoSend
return
$+SC028::
SendStr = *
Gosub, DoSend
return

$SC073::
SendStr = \
Gosub, DoSend
return
$+SC073::
SendStr = _
Gosub, DoSend
return

$SC00D::
SendStr = ^
Gosub, DoSend
return
$+SC00D::
SendStr = ~
Gosub, DoSend
return

; ---------- Parentheses JIS ----------
$+SC009::
SendStr = (
Gosub, DoSend
return
$+SC00A::
SendStr = )
Gosub, DoSend
return
$+SC00B::
SendStr = 0
Gosub, DoSend
return

#If
