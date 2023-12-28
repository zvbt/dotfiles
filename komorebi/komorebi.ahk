#SingleInstance Force
#Include komorebic.lib.ahk
#Include komorebi.generated.ahk

AltFocusHack("enable")
WindowHidingBehaviour("cloak")
CrossMonitorMoveBehaviour("Insert")
WatchConfiguration("enable")
EnsureNamedWorkspaces(0, "I II III IV V")
NamedWorkspaceLayout("I", "bsp")
NamedWorkspacePadding("I", 10)
NamedWorkspaceContainerPadding("I", 10)


InvisibleBorders(5, 0, 10, 5)
ActiveWindowBorderColour(123, 66, 245, "single")
ActiveWindowBorderColour(255, 51, 153, "monocle")
ActiveWindowBorderColour(256, 165, 66, "stack")

; ! = lAlt
;  + = LShift

; Focus windows
!h::Focus("left")
!k::Focus("down")
!l::Focus("up")
!j::Focus("right")
!+[::CycleFocus("previous")
!+]::CycleFocus("next")

; Move windows
!+h::Move("left")
!+k::Move("down")
!+l::Move("up")
!+j::Move("right")
!+Enter::Promote()

; Resize
!=::ResizeAxis("horizontal", "increase")
!-::ResizeAxis("horizontal", "decrease")
!+=::ResizeAxis("vertical", "increase")
!+-::ResizeAxis("vertical", "decrease")

; Manipulate windows
!t::ToggleFloat()
!+f::ToggleMonocle() ;fullscreen focused window


; Window manager options
!+r::Retile()
!p::TogglePause()

; Layouts
!x::FlipLayout("horizontal")
!y::FlipLayout("vertical")

; Personal
!m::Minimize()
!q::Close()
!+o::ReloadConfiguration()


CompleteConfiguration()