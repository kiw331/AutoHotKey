Gui, Add, Text, x30 y5 w100 h20, 테스트 프로그램
Gui, Add, Text, x20 y30 w70 h20, 테스트 횟수: 
Gui, Add, Text, x95 y30 w40 h20 v횟수, 0 회
Gui, Add, Text, x20 y53 w60 h20, 제한:
Gui, Add, Edit, x85 y50 w40 h20 v제한, 1
Gui, Add, Text, x150 y5 w70 h20, 실행시간:
Gui, Add, Text, x230 y5 w100 h20 v실행시간, 0시간 0분 0초


Gui, Add, CheckBox, x20 y80 w100 h20 v체크 Checked, 체크사용	;Checked->1, 디폴트는0
Gui, Add, Text, x20 y113 w40 h20, 콤박:
Gui, Add, ComboBox, x60 y110 w60 h200 v메뉴 Choose3, 메인|사망|엑셀
Gui, Add, ListView, x140 y25 w200 h105 v로그 Grid, 시간|동작	;옵션부분에 Grid: 항목간 선 추가

Gui, Add, Button, x140 y140 w60 h20, 시작
Gui, Add, Button, x210 y140 w60 h20, 멈춤
Gui, Add, Button, x280 y140 w60 h20, 종료
Gui, Add, Button, x20 y140 w60 h20, 정보

global sv := false	;state value
global 실행시간_:=0	


Gui, Show

로그추가("프로그램실행")
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen	

return

a & s::
Button시작:
{
	sv=true
	실행시간_:=0
	SetTimer, 시간측정, 1000	
	
	MouseMove 40, 130
	Click 2
	Sleep 20000
	
	WinGetPos, wX, wY, wWidth, wHeight, 녹스 플레이어
	global wX
	global wY	
	global eX := wX + wWidth
	global eY := wY + wHeight
	
	녹스클릭(730,180)
	Sleep 20000
	
	while(1)
	{
		이미지서치("x버튼1")
		if(ErrorLevel=0)
		{
			Click
			Sleep 3000
			break
		}
	}
	
	Click
	Sleep 5000
	
	녹스클릭(400,200)	;유니온
	
	Sleep 4000
	
	이미지서치("x버튼2")
	if(ErrorLevel != 0)
	{
		;goto, Button멈춤
	}
	Click
	Sleep 3000
	
	이미지서치("게임시작")
	if(ErrorLevel != 0)
	{
		goto, Button멈춤
	}
	Click
	Sleep 7000
	
	녹스클릭(680,60)	;빠던
	Sleep 1500
	
	녹스클릭(250,200) ;미던
	Sleep 1500
	
	녹스클릭(600,400)
	Sleep 3000
	
	녹스클릭(250,500)	;오토
	Sleep 500
	
	녹스클릭(500,430)	;시작2
	Sleep 60000
	
	피버카운트 := 0
	while( (sv=true) && (피버카운트<3))	
	{
		이미지서치("피버")
		if(ErrorLevel=0)
		{
			MsgBox,,, 피버카운트: %피버카운트% , 1
			피버카운트++
			Sleep 30000
		}
		Sleep 60000
		;광고제거()
	}
	
	녹스클릭(850,50)	;메뉴
	Sleep 300
	
	녹스클릭(300,60)	;과제
	Sleep 800
	녹스클릭(70,300) ;일일온라인
	Sleep 300
	
	받기카운트 := 0
	while((sv=true) && 받기카운트<5)	;5
	{
		이미지서치("받기")
		if(ErrorLevel=0)
		{
			MsgBox,,, 받기카운트: %피버카운트% , 1
			피버카운트++
			Sleep 800
			;광고제거()
		}
		else if(ErrorLevel=1)
		{
			Sleep 20000
		}
	}
	
	녹스클릭 (860,60) ;x3
	Sleep 500
	녹스클릭 (400,300) ;빈화면
	Sleep 300
	녹스클릭 (800,180) ;나가기
	Sleep 300
	녹스클릭 (400,400) ;외출
	Sleep 1000
	
	녹스클릭 (900,500) ;다중창
	MouseMove 400,300
	Click, down
	MouseMove 30,300,30
	Click, up
	
}
return

녹스클릭(nx,ny)
{
	nx_ := nx + wX
	ny_ := ny + wY
	Click, %nx_%, %ny_%
}
return 

광고제거()
{
	MsgBox,,, 저리가라 광고야,1
	녹스클릭(760,70)
	
}



시간측정:
{
	실행시간_++
	시 := Floor(실행시간_/3600)	;소숫점 버림
	분 := Floor(실행시간_/60)
	초 := Mod(실행시간_, 60)	;나머지 구하기
	GuiControl,, 실행시간, %시%시간 %분%분 %초%초
}
return	;리턴꼭 쓰자 ㅠㅠ 

s & d::
Button멈춤:
{
	로그추가("멈춤")
	SetTimer, 시간측정, OFF	;시간측정 라벨로 만들어진 타이머를 끈다
	sv := false
}
return

Button종료:
{
	ExitApp
}
return

Button정보:
{
	;~ 로그추가("현재시간보기")
	;~ FormatTIme, curTime1,,tt h시 m분 s초
	;~ FormatTIme, curTime2,, H시 m분 s초
	;~ FormatTIme, curTime3,, yyyy년 M월 d일 | tt h시 m분 s초
	;~ MsgBox, %curTime1% `n %curTime2% `n %curTime3%
	
	MsgBox, 녹스 플레이어: %wX%`, %wY%`, %eX%`, %eY%
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
	}
	else
	{
		MsgBox,,, 이미지 찾기실패 `n`n ErrorLevel: %ErrorLevel% ,1
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