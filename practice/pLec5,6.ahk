Gui, Add, Text, x10 y10 w150 h20 center, 매크로 프로그램
Gui, Add, Button, x10 y30 w150 h20, 시작
Gui, Add, Button, x10 y55 w150 h20, 종료
;Gui, Show
Gui, Show, ,lec4		;창이름 바꾸고 싶을 때
CoordMode, Mouse, Screen
return

Button시작:
{
	Click, 0, 0
	Send {Click, 4, 4}
	;Send하고 띄워쓰기 해야된다
	MouseMove, 200, 200
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