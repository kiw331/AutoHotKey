Gui, Add, Text, x10 y10 w150 h20 center, 매크로 프로그램
Gui, Add, Button, x10 y30 w150 h20, 시작
Gui, Add, Button, x10 y55 w150 h20, 종료
;Gui, Show
Gui, Show, ,lec4		;창이름 바꾸고 싶을 때
return
Button시작:
{
	CoordMode, Mouse, Screen ; 바탕화면 기준으로 클릭, 없으면 활성화된 화면이 기준이 됨
	Click 10, 10
	;Send {Click 10,10}
}
return

Button종료:
{
	ExitApp
}
  
GuiClose:
{
	ExitApp
}
return
