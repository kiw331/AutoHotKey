Gui, Add, Text, x10 y10 w150 h20 center, 매크로 프로그램
Gui, Add, Button, x10 y30 w150 h20, 시작
Gui, Add, Button, x10 y55 w150 h20, 종료
;Gui, Show
Gui, Show, ,lec4		;창이름 바꾸고 싶을 때
CoordMode, Mouse, Screen
return

Button시작:
{
	x:=0
	y:=0
	MouseMove, %x%, %y%
	
	Sleep 1500
	
	x:=100
	y:=100
	MouseMove, %x%, %y%

}
return

Button종료:
{
	ExitApp
}
  
GuiClose:
{
	MsgBox 종료됩니다
	ExitApp
}
return