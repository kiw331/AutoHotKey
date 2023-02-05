Gui, Add, Text, x10 y10 w150 h20 center, 매크로 프로그램
Gui, Add, Button, x10 y30 w150 h20, 시작
Gui, Add, Button, x10 y55 w150 h20, 멈춤
sv := false
Gui, Add, Button, x10 y80 w150 h20, 종료
Gui, Show

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen	;좌표기준

return

Button시작:
{
	sv := true
	While(sv=true)
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 image\Pre.bmp
		if(ErrorLevel=0)
		{
			MsgBox,,테스트,%X% %Y%,3
			Click, Right, %X%, %Y%
		}
	}

}
return

Button멈춤:
{
	sv := false
}
return

Button종료:
{
	ExitApp
}
return
  
GuiClose:
{
	ExitApp
}
return