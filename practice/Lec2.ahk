Gui, Add, Text, x50 y5 w110 h20, 매크로 프로그램
Gui, Add, Button, x40 y25 w110 h20, 시작
Gui, Add, Button, x40 y55 w110 h20, 종료
Gui, Add, Button, x40 y85 w110 h20, 좋아요
;Gui, Show
Gui, Show, , t		;창이름 바꾸고 싶을 때

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
  

Button좋아요:
{
	CoordMode, Mouse, Screen ; 
	Click 362, 619
}
return

GuiClose:
{
	ExitApp
}
return