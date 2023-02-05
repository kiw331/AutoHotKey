Gui, Add, Text, x30 y5 w100 h20, 테스트 프로그램
Gui, Add, Text, x20 y30 w70 h20, 테스트 횟수: 
Gui, Add, Text, x95 y30 w40 h20 v횟수, 0회
Gui, Add, Text, x20 y53 w60 h20, 제한:
Gui, Add, Edit, x85 y50 w40 h20 v제한, 1

Gui, Add, CheckBox, x20 y80 w100 h20 v체크 Checked, 체크사용	;Checked->1, 디폴트는0
Gui, Add, Text, x20 y113 w40 h20, 콤박:
Gui, Add, ComboBox, x60 y110 w60 h200 v스킬 Choose1, 스킬1|스킬2	
Gui, Add, ListView, x140 y25 w200 h105 v로그 Grid, 시간|동작	;옵션부분에 Grid: 항목간 선 추가

Gui, Add, Button, x140 y140 w60 h20, 시작
Gui, Add, Button, x210 y140 w60 h20, 멈춤
global sv := false	;state value
Gui, Add, Button, x280 y140 w60 h20, 종료
Gui, Add, Button, x20 y140 w60 h20, 현재시간

FormatTime, curTime,, M-d H:m:s
LV_Add("",curTime,"프로그램 실행")
LV_ModifyCol()	;위에 한번만 있어되 됨

;~ WinGetPos, wX, wY, wWidth, wHeight, 녹스 플레이어	;작업관리자 기준
;~ eX := wX + wWidth
;~ eY := wY + wHeight

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
		if(체크=0)
		{
			break
		}
		ImageSearch, OutX, OutY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 image\Premium.bmp
		if(ErrorLevel=0)
		{
			FormatTime, curTime,, M-d H:m:s
			LV_Add("",curTime,"이미지1 찾음")
			
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

Button현재시간:
{
	FormatTIme, curTime1,,tt h시 m분 s초
	FormatTIme, curTime2,, H시 m분 s초
	FormatTIme, curTime3,, yyyy년 M월 d일 | tt h시 m분 s초
	MsgBox, %curTime1% `n %curTime2% `n %curTime3%

}
return
  
GuiClose:
{
	ExitApp
}
return