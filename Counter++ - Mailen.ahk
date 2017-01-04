
global WorkDir := "G:\SME BO\Autostart\AHT"

gui_active_id := 0

if not InStr(FileExist("H:\Köer"), "D" )
{
	FileCreateDir, "H:\Köer"
}

{
	Loop, %WorkDir%\*.txt
	{
		test := "H:\Köer\" . A_LoopFileName
		IfNotExist, %test%
			FileAppend, 0, %test%
	}
}

Loop, %WorkDir%\*.txt
{
	test := A_LoopFileName
	StringTrimRight, test, test, 4
	MallarList .= test . "|"
}
StringTrimRight, MallarList, MallarList, 1

m_mobilftg := 0
m_kampanj := 0
m_sr := 0
m_sas := 0
m_överl := 0
m_portering := 0
m_skanska := 0

aht_mobilftg := 500
aht_öv := 315
aht_churn := 240
aht_nummerflytt := 120

Label1 := 0
Label2 := 0
Label3 := 0
Label4 := 0

FileRead, m_mobilftg, H:\Köer\mobilftg.txt
FileRead, m_överl, H:\Köer\SR.txt
FileRead, m_nummerflytt, H:\Köer\överlåtelse.txt
FileRead, m_churn, H:\Köer\nummerflytt.txt

Gui, Counter:New, +Resize -MaximizeBox +AlwaysOnTop, Counter

x := 10
y := 10
w := 100
h := 24

settings := "x"  . x . " y" . y . " w" . w
Gui, Counter:Add, DropDownList, %settings% Choose1 gLabel1 vLabel1name, %MallarList%

x := x + w + 5
w := 30
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel+1, +

x := x + w + 5
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel-1, -

x := x + w + 5
settings := "x"  . x . " y" . y + 6 . " w" . w . " h" . h
Gui, Counter:Add, Text, %settings% vm_label1, 0

x := x + w + 5
w := 40
settings := "x"  . x . " y" . y + 6 . " w" . w . " h" . h
Gui, Counter:Add, Text, %settings% vm_mobilftgaht, 0

y := y + 30
x := 10
w := 100
settings := "x"  . x . " y" . y . " w" . w
Gui, Counter:Add, DropDownList, %settings% Choose3 gLabel2 vLabel2name, %MallarList%

x := x + w + 5
w := 30
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel+2, +

x := x + w + 5
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel-2, -

x := x + w + 5
settings := "x"  . x . " y" . y + 6 . " w" . w . " h" . h
Gui, Counter:Add, Text, %settings% vm_label2, 0

x := x + w
w := 70
settings := "x"  . x . " y" . y . " w" . w . " h" . H
Gui, Counter:Add, Progress, %settings% cBlue vMyProgress,  



y := y + 30
x := 10
w := 100
settings := "x"  . x . " y" . y . " w" . w
Gui, Counter:Add, DropDownList, %settings% Choose2 gLabel3 vLabel3name, %MallarList%

x := x + w + 5
w := 30
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel+3, +

x := x + w + 5
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel-3, -

x := x + w + 5
settings := "x"  . x . " y" . y + 6 . " w" . w . " h" . h
Gui, Counter:Add, Text, %settings% vm_label3, 0


y := y + 30
x := 10
w := 100
settings := "x"  . x . " y" . y . " w" . w
Gui, Counter:Add, DropDownList, %settings% Choose5 gLabel4 vLabel4name, %MallarList%

x := x + w + 5
w := 30
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel+4, +

x := x + w + 5
settings := "x"  . x . " y" . y . " w" . w . " h" . h
Gui, Counter:Add, Button, %settings% gLabel-4, -

x := x + w + 5
settings := "x"  . x . " y" . y + 6 . " w" . w . " h" . h
Gui, Counter:Add, Text, %settings% vm_label4, 0

Gui, Counter:Submit

path := "H:\Köer\" . Label1name . ".txt"
FileRead, Label1, H:\Köer\%Label1name%.txt
GuiControl, Counter:, m_label1, %Label1%

FileRead, Label2, H:\Köer\%Label2name%.txt
GuiControl, Counter:, m_label2, %Label2%

FileRead, Label3, H:\Köer\%Label3name%.txt
GuiControl, Counter:, m_label3, %Label3%

FileRead, Label4, H:\Köer\%Label4name%.txt
GuiControl, Counter:, m_label4, %Label4%

CountAHT()

Menu, FileMenu, Add, &Open`tCtrl+O, MenuFileMenuOpen  ; See remarks below about Ctrl+O.
Menu, FileMenu, Add, E&xit, MenuFileMenuExit
Menu, HelpMenu, Add, &About, MenuHelpMenuAbout
Menu, HelpMenu, Add, &Clear All, MenuHelpMenuClearAll
Menu, MyMenuBar, Add, &File, :FileMenu  ; Attach the two sub-menus that were created above.
Menu, MyMenuBar, Add, &Help, :HelpMenu
Menu, MyMenuBar, Add, &Restart, RestartMenu
Menu, MyMenuBar, Add, &Edit, EditMenu
Gui, Counter:Menu, MyMenuBar

Menu, FileMenu, ToggleCheck, &Open`tCtrl+O

Gui, Show, H130, Counter

WinGet, gui_active_id, ID, A

OnMessage(0x200,"WM_MOUSEHOVER")

MenuFileMenuOpen:
	Menu, FileMenu, ToggleCheck, &Open`tCtrl+O
	WinSet, AlwaysOnTop, Toggle, Counter
	
Return
MenuFileMenuExit:
Return

MenuHelpMenuAbout:
Return

GuiClose:
	ExitApp
return

MenuHelpMenuClearAll:

	Loop, %WorkDir%\*.txt
	{
		test := "H:\Köer\" . A_LoopFileName
		IfExist, %test%
			FileDelete, %test%
		FileAppend, 0, %test%
			
	}

	
	Gui, Counter:Submit
	
	FileRead, Label1, H:\Köer\%Label1name%.txt

	FileRead, Label2, H:\Köer\%Label2name%.txt

	FileRead, Label3, H:\Köer\%Label3name%.txt

	FileRead, Label4, H:\Köer\%Label4name%.txt
	
	Update()
Return

EditMenu:
	Edit
return

RestartMenu:
	Reload
return

Label+1:
	Gui,Counter:Submit
	global Label1 += 1

	path := "H:\Köer\" . Label1name . ".txt"
	FileDelete, %path%
	FileAppend, %Label1%, %path%
	Update()
return

Label-1:
	Gui, Counter:Submit
	global Label1 -= 1
	GuiControl,, m_label1, %Label1%

	path := "H:\Köer\" . Label1name . ".txt"
	FileDelete, %path%
	FileAppend, %Label1%, %path%
	Update()
return

Label1:
	Gui, Counter:Submit
	path := "H:\Köer\" . Label1Name . ".txt"
	FileRead, test, %path%
	Label1 := test 
	Update()
	
return

!1::
	active_id := ""
	global gui_active_id
	IfWinNotActive, Counter
	{
		WinGet, active_id, ID, A
		WinActivate, ahk_id %gui_active_id%
	}

	global Label1 += 1
	
	path := "H:\Köer\" . Label1name . ".txt"
	FileDelete, %path%
	FileAppend, %Label1%, %path%
	Update()

	if (active_id <> "")
	{
		WinActivate, ahk_id %active_id%
	}
return

Label+2:
	Gui, Counter:Submit
	global Label2 += 1
	path := "H:\Köer\" . Label2name . ".txt"
	FileDelete, %path%
	FileAppend, %Label2%, %path%
	Update()

return

Label-2:
	Gui, Counter:Submit
	global Label2 -= 1

	path := "H:\Köer\" . Label2name . ".txt"
	FileDelete, %path%
	FileAppend, %Label2%, %path%
	Update()

return

Label2:
	Gui, Counter:Submit
	path := "H:\Köer\" . Label2Name . ".txt"
	FileRead, test, %path%
	Label2 := test
	Update()

return
!2::
	active_id := ""
	global gui_active_id
	IfWinNotActive, Counter
	{
		WinGet, active_id, ID, A
		WinActivate, ahk_id %gui_active_id%
	}

	global Label2 += 1

	if (active_id <> "")
	{
		WinActivate, ahk_id %active_id%
	}
	path := "H:\Köer\" . Label2name . ".txt"
	FileDelete, %path%
	FileAppend, %Label2%, %path%
	Update()

return

Label+3:
	Gui, Counter:Submit
	global Label3 += 1

	path := "H:\Köer\" . Label3name . ".txt"
	FileDelete, %path%
	FileAppend, %Label3%, %path%
	Update()

return

Label-3:
	Gui, Counter:Submit
	global Label3 -= 1

	path := "H:\Köer\" . Label3name . ".txt"
	FileDelete, %path%
	FileAppend, %Label3%, %path%
	Update()

return

Label3:
	Gui, Counter:Submit
	path := "H:\Köer\" . Label3Name . ".txt"
	FileRead, test, %path%
	Label3 := test
	Update()
return
!3::
	active_id := ""
	global gui_active_id
	IfWinNotActive, Counter
	{
		WinGet, active_id, ID, A
		WinActivate, ahk_id %gui_active_id%
	}

	global Label3 += 1

	if (active_id <> "")
	{
		WinActivate, ahk_id %active_id%
	}
	Update()

return

Label+4:
	Gui, Counter:Submit
	global Label4 += 1

	path := "H:\Köer\" . Label4name . ".txt"
	FileDelete, %path%
	FileAppend, %Label4%, %path%
	Update()

return

Label-4:
	Gui, Counter:Submit
	global Label4 -= 1

	path := "H:\Köer\" . Label4name . ".txt"
	FileDelete, %path%
	FileAppend, %Label4%, %path%
	Update()

return

Label4:
	Gui, Counter:Submit
	path := "H:\Köer\" . Label4Name . ".txt"
	FileRead, test, %path%
	Label4 := test
	Update()
	
return
!4::
	active_id := ""
	global gui_active_id
	IfWinNotActive, Counter
	{
		WinGet, active_id, ID, A
		WinActivate, ahk_id %gui_active_id%
	}

	global Label4 += 1

	if (active_id <> "")
	{
		WinActivate, ahk_id %active_id%
	}
	path := "H:\Köer\" . Label4name . ".txt"
	FileDelete, %path%
	FileAppend, %Label4%, %path%
	Update()
	
return


CountAht()
{
	Gui, Submit
	global WorkDir
	test := 0
	Loop, %WorkDir%\*.txt
	{
		m_path := "H:\Köer\" . A_LoopFileName
		FileReadLine, value, %m_path%, 1
		m_path := WorkDir . "\" A_LoopFileName
		FileReadLine, aht, %m_path%, 1
		aht := (aht * value) * 100 / (8 * 3600)
		test := test + aht
	}

	test := Round((test), 1)

	w := test
	color := ""
	if w < 80
	{
		SetTimer, Alert1, Off
		if w < 20
		{
			color := "FF0000"
		}
		else if w < 50
		{

		 	w := w - 20
			w := Hex(Floor((w / 30) * 255))
			StringRight, w, w, (StrLen(w) - 2)
	
			if StrLen(w) < 2
			{
				w := "0" . w
			}
			
			color := "FF" . w . "00"
		}	
		else
		{
			w := w - 50
			w := Hex(Floor(255 - ((w / 30) * 255)))

			StringRight, w, w, (StrLen(w) - 2)
			if StrLen(w) < 2
			{
				w := "0" . w
			}
		
			color := w . "FF00"
		}
	}
	else
	{
		SetTimer, Alert1, 250
	}
	GuiControl, Counter:+c%color%, MyProgress

	test .= "%"
	GuiControl, Counter:, m_mobilftgaht, %test%
	
	GuiControl, Counter:, MyProgress, %test%

}

Alert1:

	progresscolor := ""

	Random, w, 0, 255

	w := Hex(w)
	StringRight, w, w, (StrLen(w) - 2)
	if StrLen(w) < 2
	{
		w := "0" . w
	}

	progresscolor .= w
	
	Random, w, 0, 255

	w := Hex(w)
	StringRight, w, w, (StrLen(w) - 2)
	if StrLen(w) < 2
	{
		w := "0" . w
	}

	progresscolor .= w
	
	Random, w, 0, 255

	w := Hex(w)
	StringRight, w, w, (StrLen(w) - 2)
	if StrLen(w) < 2
	{
		w := "0" . w
	}

	progresscolor .= w

	GuiControl, Counter:+c%progresscolor%, MyProgress
return



WM_MOUSEHOVER()
{
	If( InStr(GetTitle(), "Counter") )
	{
		global WorkDir
		MouseGetPos, x ,y
		If( 220 < x and x < 290 and 80 < y and y < 105)
	  	{
			m_text := ""

			Loop, %WorkDir%\*.txt
			{
				m_path := "H:\Köer\" . A_LoopFileName
				FileReadLine, value, %m_path%, 1
				m_path := WorkDir . "\" A_LoopFileName
				FileReadLine, aht, %m_path%, 1

				aht := Round((aht * value) * 100 / (8 * 3600), 1)
				value := SubStr(A_LoopFileName, 1, StrLen(A_LoopFileName) - 4) 
				m_text .= value . ": " . aht . "%`n"
			}
			ToolTip, %m_text%, 222, 85
		}
		else
		{
			ToolTip
		}
	}
	else
	{
		ToolTip
	}
	return
}

StrToInt(stringin)
{ 
	ret := stringin, Number += 0
	if ret is space
		ret := 0
	return ret
}
Update()
{
	global Label1
	global Label2
	global Label3
	global Label4

	GuiControl, Counter:, m_label1, %Label1%
	GuiControl, Counter:, m_label2, %Label2%
	GuiControl, Counter:, m_label3, %Label3%
	GuiControl, Counter:, m_label4, %Label4%

	CountAht()

	Gui, Show
}


Hex(value)
{
	OldFormat := A_FormatInteger ; save the current format as a string
	SetFormat, Integer, Hex
	value += 0

	SetFormat, Integer, %OldFormat%
	
	return value
	
}


GetTitle()
{
	WinGetTitle, ret, A
	return ret
}