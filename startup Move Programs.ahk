

Suspend, off

m_tab_delay = 300


List := Get_ID_List()

FileDelete, H:\startup Move.txt

for i, value in List
{
	WinGetPos, x, y, w, h, %value%
	FileAppend, %value%`, %x%`, %y%`, %w%`, %h%`n, H:\startup Move.txt
}


MsgBox, 262147, Startup Move, Har du dubbleskärm?, 600

File := 0

IfMsgBox, Yes
{
	FileRead, File, H:\Startup Move Dubble.txt
	if ErrorLevel
	{
		File := 0
	}
}
else IfMsgBox, No
{
	FileRead, File, H:\Startup Move Stor.txt
	if ErrorLevel
	{
		File := 0
	}	
}

if(File)
{
	List := 0
	List := StrSplit(File, "`r`n")
	for i, value in List
	{
		arr := StrSplit(value, "`,")
		title := arr[1]
		x := arr[2]
		y := arr[3]
		w := arr[4]
		h := arr[5]
		;MsgBox, %title%, %x% %y%, %w% %h%

		WinMove, %title%, , %x%, %y%, %w%, %h%
	}
}
else
{
	MsgBox, Error loading file.
}

CopyAreaBass(x,y,w,h)
{
	temp_x := x
	temp_y := x
	Click down, %temp_x%, %temp_y%
	temp_x := x + w
	temp_y := y + h
	Click up, %temp_x%, %temp_y%
	;Click right, 100, 100
}



Get_ID_List()
{
	WinGet, Title, List
	ret := []
	Loop, %Title%
	{
		temp_id := Title%A_Index%
		WinGetTitle, temp_title ,ahk_id %temp_id%
		ret.Push(temp_title)
	}
	Return ret
}

GetTitle()
{
	WinGetActiveTitle, ret
	return ret
}

Min(l,r)
{
	if(l < r)
		return l
	else
		return r
}

Max(l,r)
{
	if(l > r)
		return l
	else
		return r
}