Gui, Add, Text, x10 y10 w150 h20 center, 테스트 프로그램
Gui, Add, Text, x60 y30 w50 h20 center v횟수, 0회
Gui, Add, Edit, x60 y50 w50 h20 v제한, 0
Gui, Add, Button, x10 y80 w150 h20, 시작
Gui, Add, Button, x10 y110 w150 h20, 멈춤
sv := false	;state value
Gui, Add, Button, x10 y140 w150 h20, 종료

WinGetPos, wX, wY, wWidth, wHeight, 녹스 플레이어	;작업관리자 화살표 눌렀을 때 표시되는거 기준
eX := wX + wWidth
eY := wY + wHeight

Gui, Show
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen	;좌표기준

return

a & s::
Button시작:
{
	sv := true
	i := 0

	Gui, Submit,nohide			;변수(Edit)에 적은 값을 업데이트함
	while ( (i < 제한) && (sv=true)) 
	{
		if(sv=false)
		{
			break
		}
		ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 image\Premium.bmp
		if(ErrorLevel=0)
		{
			GuiControl, ,횟수,%A_Index% 회
			MOuseMove, %OutX%, %OutY% 
			Click, Right
			MsgBox,,test,테스트,2
		}
		else
		{
			MsgBox 픽셀찾기 실패
			MsgBox ErrorLevel: %ErrorLevel%
		}
		i++
	}
}
return

s & d::
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