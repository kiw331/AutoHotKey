Gui, Add, Text, x30 y5 w110 h20, 매크로 프로그램
Gui, Add, Text, x60 y30 w50 h20 v횟수, 0회
Gui, Add, Edit, x48 y50 w50 h20 v제한, 0

Gui, Add, Button, x20 y80 w110 h20, 시작
Gui, Add, Button, x20 y110 w110 h20, 멈춤
Gui, Add, Button, x20 y140 w110 h20, 종료
Gui, Add, Button, x20 y170 w110 h20, 누르고있기


Gui, Show, , 매크로

매크로상태 := false

return


Button시작:
{
	매크로상태 :=  true
	CoordMode, Mouse, Screen	;위에 한번만 써주면 됨
	Gui, Submit,nohide			;시작버튼 누르기전에 변수(Edit)에 적은 값을 업데이트함
	Loop, %제한% 
	{
		;Click 134, 627
		Click, right, 134, 627	;오마클
		GuiControl,,횟수, %A_Index%회	;오토핫키 기본 변수, 루프 횟수 카운트
		Sleep, 1000						;딜레이 명령어 1000ms(1초)만큼 기다림
		
		
		if(매크로상태=false)
		{
			break
		}
	}
}
return

Button누르고있기:
{
	매크로상태 :=  true
	CoordMode, Mouse, Screen	
	Gui, Submit,nohide	
	Loop, %제한% 
	{
		Click, down 162, 97
		GuiControl,,횟수, %A_Index%회
		Sleep, 3000
		Click, up
		Sleep, 3000
		
		if(매크로상태=false)
		{
			break
		}
	}
}
return

Button종료:
{
	ExitApp
}

Button멈춤:
{
	매크로상태:=false
}
  

GuiClose:
{
	ExitApp
}
return