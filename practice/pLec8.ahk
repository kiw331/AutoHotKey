Gui, Add, Text, x10 y10 w150 h20 center, 매크로 프로그램
Gui, Add, Button, x10 y30 w150 h20, 시작
Gui, Add, Button, x10 y55 w150 h20, 종료
;Gui, Show
Gui, Show, ,lec4		;창이름 바꾸고 싶을 때
CoordMode, Mouse, Screen
a:=1
return

Button시작:
{
	x:=0
	y:=0
	MouseMove, %x%, %y%
	Sleep 1500
		
	if(a=1)
	{
		MouseMove, 100, 100
		Sleep 1000
	}
	else
	{
		MouseMove 200, 200
		Sleep 1000
	}

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