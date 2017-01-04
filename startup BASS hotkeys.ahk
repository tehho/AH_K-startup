


SendMode Play
CoordMode, Mouse, Relative

^+4::
MsgBox, Reloading BASS hotkeys

Reload

Return


#If InStr(GetTitle(), "prodbass")
:*:20`na`n::

MsgBox, 3, Samlingsfaktura, Ska numret in på ett existerande kundnummer?`nKopiera detta nu!
ifMsgBox Cancel
{
	return
}
Send a{ENTER}s{ENTER}{ENTER}{ENTER}
ifMsgBox Yes
{
	Send e{ENTER}
	Sleep 100
	Send !ri{ENTER}{ENTER}
}
else ifMsgBox No
{
	Send n{ENTER}
}
Send {ENTER}{ENTER}{ENTER}y{ENTER}ca{ENTER}{ENTER}y{ENTER}
return


:*:20`nt`n::

m_clipboard := clipboard

MsgBox, 3, Samlingsfaktura, Ska numret in på ett nytt kundnummer?`nKopiera detta nu!
ifMsgBox Cancel
{
	return
}
Send t{ENTER}s{ENTER}{ENTER}övgodfr{ENTER}{ENTER}{ENTER}
ifMsgBox Yes
{
	Send n{ENTER}{TAB}
	Sleep 100
	Send !ri{TAB}y{ENTER}y{ENTER}
}
else ifMsgBox No
{
	Send n{ENTER}

	MsgBox, Ej fixad
	return
}

Send {ENTER}övgodti{ENTER}{ENTER}{ENTER}{ENTER}y{ENTER}{F11}y{ENTER}ca{ENTER}{ENTER}y{ENTER}

Sleep 1000

GetPos(100,113,94,12)

Sleep 200

clipboard := StrReplace(clipboard, " ", "", All )
clipboard := StrReplace(clipboard, ")", "", All )

Sleep 200

Send {RIGHT}!ri{ENTER}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}!ri{ENTER}
Send {F11}{F11}y{ENTER}

clipboard := m_clipboard

return

^!q::
global m_id := WinExist("A")

x := 10
y := 10
h := 24
w := 100
Gui, New, +Resize -MaximizeBox, Avsluta abonnemang


Gui, Add, Text, x10 y10 w200 h450, Avsluta abonnemang

y := y + 30

settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, Button, Default %settings% gAvsluta_90_dagar, Avsluta 90 dagar

x := x + w + 10
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, Button, %settings%, Avsluta_direkt

x := x + w + 10
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, Button, %settings%, Avsluta_utsatt_tid

x := 10
y := y + 30
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, Button, %settings%, Oppna_for_utport

x := x + w + 10
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, Button, %settings% gGetInvoice, Hämta faktura

x := 10
y := y + 30
settings := "x" . x . " y" . y . " h" h . " w" . w 

Gui, Add, Button, %settings% gGetAllabolag, Öppna Allabolag

Gui, Show,, Avsluta abonnemang

return

!^t::

global m_id := WinExist("A")

Gui, New, +Resize -MaximizeBox, Tripplebyte
Gui, Add, Button, w100, Genomför
Gui, Add, Edit, r1 vTelefon1 w100, Första numret
Gui, Add, Edit, r1 vTelefon2 w100, Andra numret
Gui, Add, Edit, r1 vTelefon3 w100, Temporära numret

Gui, Show,, Tripplebyte

return

ButtonOppna_for_utport:

global m_id

WinActivate, ahk_id %m_id%

date := GetNextDate()

Sleep 100

FormatTime, Yesterday, %date% , dd/MM/yyyy

	m_clip := clipboard
	Sleep 100	
	clipboard := Yesterday
	Sleep 100
	Send 34{ENTER}
	Sleep 100
	Send {RIGHT}!ri{ENTER}{F11}{ESC}
	Sleep 100
	clipboard := m_clip
return

ButtonGenomför:


global m_id

WinGetTitle, title, ahk_id %m_id%

if(not InStr(title, "prodbass"))
{
	MsgBox, Selected window is not BASS.
	Gui, destroy
	return
}

WinActivate, ahk_id %m_id%

return

Avsluta_90_dagar:

global m_id

WinGetTitle, title, ahk_id %m_id%

if(not InStr(title, "prodbass"))
{
	MsgBox, Selected window is not BASS.
	Gui, destroy
	return
}

WinActivate, ahk_id %m_id%

today := 0
today += 0, days
FormatTime, today, %today%, d MMMM yyyy

date := GetNextDate()

Sleep 100

FormatTime, Yesterday, %date% , dd/MM/yyyy
FormatTime, Yesterday0, %date% , d MMMM yyyy

Send 11{ENTER}
Send 7{ENTER}
Send {TAB}chur{ENTER}

Sleep 500
GetPos(260, 156, 120, 12)

if(InStr(clipboard, "*** WARNING ***") )
{

	Send y{ENTER}
}
Sleep 100
Send okän{ENTER}okän{ENTER}
Send {ENTER}{ENTER}{TAB}y{ENTER}
Send A910{ENTER}{F11}

Sleep 500
GetPos(234, 200, 140, 12)

if(InStr(clipboard, "REFERENCE NUMBERS") )
{

	Send {F11}{ENTER}{ENTER}
}

Send y{ENTER}

Send %Yesterday%{ENTER}y{ENTER}
Sleep 500
GetPos(209, 127, 243, 10)

Sleep 500

if(InStr(clipboard, "CHURN FEE BREAKDOWN BY PRODUCT"))
{
	Send {ESC}
}
Send c{enter}
Sleep 100
Send churnftg{ENTER}
Send inget{ENTER}
Send ca{ENTER}
Send {ENTER}
Send y{ENTER}
Send 1{ENTER}
Send {RIGHT}%today%{ENTER}
Send %yesterday0%{ENTER}
return
Send {F11}y{ENTER}
Send {F11}

Gui, destroy
Return

ButtonAvsluta_direkt:


global m_id

WinGetTitle, title, ahk_id %m_id%

if(not InStr(title, "prodbass"))
{
	MsgBox, Selected window is not BASS.
	Gui, destroy
	return
}

WinActivate, ahk_id %m_id%

today := 0
today += 0, days
FormatTime, today, %today%, d MMMM yyyy


date := 0
date += 0, days
FormatTime, Yesterday0, %date%, dd/MM/yyyy
FormatTime, Yesterday, %date%, d MMMM yyyy


Send 11{ENTER}
Send 7{ENTER}
Send {TAB}chur{ENTER}
Send okän{ENTER}okän{ENTER}
Send {ENTER}{ENTER}{TAB}y{ENTER}
Send A910{ENTER}{F11}y{ENTER}

Send %Yesterday0%{ENTER}N{ENTER}{F11}
Send churnftg{ENTER}
Send inget{ENTER}
Send ca{ENTER}
Send {ENTER}
Send y{ENTER}
Send 1{ENTER}
Send {RIGHT}%today%{ENTER}
Send %yesterday%{ENTER}
Send {F11}y{ENTER}
Send {F11}


Return


GetInvoice:

Target := "Faktura Hot"

m_clipboard := clipboard

faktura := clipboard

WinGetTitle, CurrentWin, A				   ;save title of current window
WinGet, IsMaximized, MinMax, ahk_class Chrome_WidgetWin_1  ;checks to see if Chrome is minimized or maximized
WinActivate ahk_class Chrome_WidgetWin_1 ;activate chrome 

Sleep 100

WinGetTitle, TitleSave, A  ;save current tab
;loop to find the correct tab
Loop, 30
{
	WinGetTitle, Title, A  ;get active window title
  	if(InStr(Title, Target)>0 or "" . Title = TitleSave)
   	{
      		break ; Terminate the loop
	}
	Send ^{Tab}
	Sleep, 50
}

if(InStr(Title, Target) == 0)
{
	Send {Ctrl Down}t{Ctrl Up}http://tnseplapp02/{ENTER}

	Sleep 500
}

Sleep 100

MouseClick, Left, 64, 271

Send ^a
Sleep 50
Send ^v
Sleep 50
Send {Tab}{Tab}{Space}

Sleep 500

Send {Tab}{Tab}{AppsKey}

Sleep 50

Send {Down}{Enter}

;MouseClick, Middle, 52, 388

Sleep 200

Send ^{Tab}

Sleep 100

Send {F6}

Sleep 100

Send ^c

Sleep 100

UrlDownloadToFile, %clipboard%, H:\Desktop\%faktura%.pdf

Send ^w

;loop back to original tab
Loop, 30
{
	WinGetTitle, Title, A  ;get active window title
   	if(InStr(Title, TitleSave)>0)
   	{
      		break ; Terminate the loop
	}
	Send ^{Tab}
	Sleep, 50
}
;minimize chrome if it was minimized before
if IsMaximized=-1
{
	WinMinimize ahk_class Chrome_WidgetWin_1
}

;go back to active window
WinActivate, %CurrentWin%

Gui, destroy

clipboard := m_clipboard

return

GetAllabolag:

	global m_id

	WinActivate, ahk_id %m_id%

	Sleep 100
	
	GetPos(115,140, 90, 10)	

	Sleep 100

	clipboard := StrReplace(clipboard, "-")

	WinActivate ahk_class Chrome_WidgetWin_1 ;activate chrome 

	Send ^t

	clipboard := "http://www.allabolag.se/" . clipboard . "/befattningar"

	Sleep 100

	Send ^v{Enter}

	Sleep 100

	Gui, destroy

return

GetPos(x,y,w,h)
{
	Sleep 100

	temp_x := x
	temp_y := y
	Click down, %temp_x%, %temp_y%
	temp_w := x + w
	temp_h := y + h
	Click up, %temp_w%, %temp_h%

	Sleep 100
	Click right, %temp_x%, %temp_y%

	
}


GetTitle()
{
	WinGetActiveTitle, ret
	return ret
}

GetNextDate()
{
	ret := 0
	months := ["31","28","31","30","31","30","31","31","30","31","30","31"]

	date := A_NOW

	FormatTime, year, %date%, yyyy
	FormatTime, month, %date%, MM
	FormatTime, Date, %date%, dd

	month += 2

	month := MOD(month , 12) + 1

	if month < 4
		year += 1
	if (Date > months[month])
	{
		Date := months[month]
	}

	if month < 10
		month =0%month%

	test = %year%%month%%Date%
	return test	
}