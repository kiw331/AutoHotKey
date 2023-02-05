Gui, Add, Text, x30 y5 w100 h20, 테스트 프로그램
Gui, Add, Text, x20 y30 w70 h20, 테스트 횟수: 
Gui, Add, Text, x95 y30 w40 h20 v횟수, 0 회
Gui, Add, Text, x20 y53 w60 h20, 제한:
Gui, Add, Edit, x85 y50 w40 h20 v제한, 1


Gui, Add, CheckBox, x20 y80 w100 h20 v체크 Checked, 체크사용	;Checked->1, 디폴트는0
Gui, Add, Text, x20 y113 w40 h20, 콤박:
Gui, Add, ComboBox, x60 y110 w60 h200 v메뉴 Choose1, 썬데이|사망|엑셀
Gui, Add, ListView, x140 y25 w200 h105 v로그 Grid, 시간|동작	;옵션부분에 Grid: 항목간 선 추가

Gui, Add, Button, x140 y140 w60 h20, 시작
Gui, Add, Button, x210 y140 w60 h20, 멈춤
Gui, Add, Button, x280 y140 w60 h20, 종료
Gui, Add, Button, x20 y140 w60 h20, 현재정보

global sv := false	;state value

WinGetPos, wX, wY, wWidth, wHeight, 메이플스토리
global wX, wY	
;이거 없어도 이미지 서치 함수에서 읽히긴함  WinGetPos에서 전역변수로 받아오는건가
global eX := wX + wWidth
global eY := wY + wHeight

Gui, Show

로그추가("프로그램실행")
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
		이미지서치(메뉴)
		i++
		Sleep 1000
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

Button현재정보:
{
	;~ 로그추가("현재시간보기")
	;~ FormatTIme, curTime1,,tt h시 m분 s초
	;~ FormatTIme, curTime2,, H시 m분 s초
	;~ FormatTIme, curTime3,, yyyy년 M월 d일 | tt h시 m분 s초
	;~ MsgBox, %curTime1% `n %curTime2% `n %curTime3%
	
	MsgBox, 메이플스토리: %wX%`, %wY%`, %eX%`, %eY%
}
return

이미지서치(이미지파일)
{		
	ImageSearch, OutX, OutY, wX, wY, eX, eY, *30 image\%이미지파일%.bmp
	if(ErrorLevel=0)
	{
		MouseMove, %OutX%, %OutY% 
		로그 := 이미지파일 . "찾음"
		로그추가(로그)
		GuiControl,, 횟수, %A_Index% 회
	}
	else
	{
		MsgBox 이미지 찾기실패 `n`n ErrorLevel: %ErrorLevel%
	}
	return 
}
로그추가(텍스트)
{
	FormatTime, curTime,, M/d H:m:s
	LV_Add("",curTime,텍스트)
	LV_ModifyCol()
	return
}
  
GuiClose:
{
	ExitApp
}
return