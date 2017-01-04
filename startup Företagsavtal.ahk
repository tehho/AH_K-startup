
Suspend, off

SetTitleMatchMode, 1

SetKeyDelay 20

åf := A910
m_åf := A975
m_name =
m_welcome :=
m_npslink =
m_haveaniceday = 
m_enter_divider := "&"
m_mail := "mobilftg@telenor.se"

m_today := 0
FormatTime, m_today, , ddMMyyyy

alwaysontop := 0

m_orgnummer = 0
m_Fnamn :=
m_namn :=
m_Adress :=
m_Postnummer = 0
m_Ort :=
m_Telefonnummer :=
m_E_postadress :=
m_Username := 
m_Password := 

m_tab_delay = 300


i = 1
init_settings :=
FileRead, init_settings, H:/Settings.txt

init_settings := StrSplit(init_settings,"`r`n")


while i < init_settings.Length()
{
	value := init_settings[i]
	if InStr(value, "@:")
	{
		if InStr(value, "Namn")
		{
			i++
			m_name := init_settings[i]
			break
		}
	}
	i++
}


Gui, New, +Resize -MaximizeBox, Adminstratörs konto


x := 10
y := 10
w := 100
h := 30
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings% , Kopy pasta adminkonto

y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings%, Generera

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings% gonline_avtal, Nytt avtal

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings% gonline_tilläggsavtal, Tilläggsavtal

x := 10
y := y + h + 5
w := (w + 5) * 3 - 5
h := 180
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vTest %settings%,


y := y + h + 5
h := 18
w := 100
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings% ,Orgnummer:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_orgnummer %settings%,

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Checkbox, vEF_Firma %settings%, EF-Firma

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,Företagsnamn:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_fnamn %settings%,

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,Namn:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_namn %settings%,

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,Adress

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_adress %settings%,

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,Ort:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_ort %settings%,

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,Postnummer:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_post %settings%,

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,Telefonnummer:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_nummer %settings%,

x := 10
y := y + h + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Text, %settings%,E-post:

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Edit, vm_email %settings%,

y := y + (2 * h) + 5

Gui, Show, h%y%, Adminstratörs konto

ButtonGenerera:
Gui, Submit
m_Array := Object()
StringSplit, m_Array, Test,`n,

Loop, %m_Array0%
{
	element := m_Array%A_Index%
	If InStr(element, "Organisationsnummer")
	{
		m_test := []
		StringSplit, m_test, element,: ,
		m_orgnummer := m_test2
		m_orgnummer := StrReplace(m_orgnummer, " ")
		m_orgnummer := StrReplace(m_orgnummer, "-")
	}
	else If InStr(element, "Företagsnamn")
	{
		m_test := []
		StringSplit, m_test, element,: ,
		m_Fnamn := m_test2
		m_Fnamn := StrReplace(m_Fnamn, "  ")
		StringLeft, m_test, m_Fnamn, 1
		while m_test == " "
		{
			m_Fnamn := SubStr(m_Fnamn, 2, StrLen(m_Fnamn) - 1)
			StringLeft, m_test, m_Fnamn, 1
		}
		StringRight, m_test, m_Fnamn, 1
		while m_test == " "
		{
			m_Fnamn := SubStr(m_Fnamn, 1, StrLen(m_Fnamn) - 1)
			StringRight, m_test, m_Fnamn, 1
		}
	}
	else If InStr(element, "Beställarens namn")
	{
		m_test := []
		StringSplit, m_test, element,: ,
		m_namn := m_test2
		m_namn := StrReplace(m_namn, "  ")
		StringLeft, m_test, m_namn, 1
		while m_test == " "
		{
			m_namn := SubStr(m_namn, 2, StrLen(m_namn) - 1)
			StringLeft, m_test, m_namn, 1
		}
		StringRight, m_test, m_namn, 1
		while m_test == " "
		{
			m_namn := SubStr(m_namn, 1, StrLen(m_namn) - 1)
			StringRight, m_test, m_namn, 1
			;MsgBox % m_test
		}
		
	}
	else If InStr(element, "Adress")
	{
		If InStr(element, "E-postadress")
		{
			m_test := []
			StringSplit, m_test, element,: ,
			m_E_postadress := m_test2
			m_E_postadress := StrReplace(m_E_postadress, " ")
		}
		else
		{
			m_test := []
			StringSplit, m_test, element,: ,
			m_Adress := m_test2
			m_Adress := StrReplace(m_Adress, "  ")
			StringLeft, m_test, m_Adress, 1
			while m_test == " "
			{
				m_Adress := SubStr(m_Adress, 2, StrLen(m_Adress) - 1)
				StringLeft, m_test, m_Adress, 1
			}
			StringRight, m_test, mA_dress, 1
			while m_test == " "
				m_Adress := SubStr(m_Adress, 1, StrLen(m_Adress) - 1)
		}
	}
	else If InStr(element, "Postnummer")
	{
		m_test := []
		StringSplit, m_test, element,%A_Space%,
		m_Postnummer :=
		Loop, %m_test0%
		{
			if (m_test%A_Index% != "" and m_test%A_Index% != "Postnummer" and m_test%A_Index% != ":")
			{
				m_postnummer .= m_test%A_Index%
			}
		}
		m_Postnummer := StrReplace(m_Postnummer, " ")
		
	}
	else If InStr(element, "Ort")
	{	
		m_test := []
		StringSplit, m_test, element,: ,
		m_Ort := m_test2
		m_Ort := StrReplace(m_Ort, "  ")
		StringLeft, m_test, m_Ort, 1
		while m_test == " "
		{
			m_Ort := SubStr(m_Ort, 2, StrLen(m_Ort) - 1)
			StringLeft, m_test, m_Ort, 1
		}
		StringRight, m_test, m_Ort, 1
		while m_test == " "
		{
			m_Ort := SubStr(m_Ort, 1, StrLen(m_Ort) - 1)
			StringRight, m_test, m_Ort, 1
		}
	}
	else If InStr(element, "Telefonnummer")
	{
		m_test := []
		StringSplit, m_test, element,: ,
		m_Telefonnummer := m_test2
		m_Telefonnummer := StrReplace(m_Telefonnummer, " ")
		m_Telefonnummer := StrReplace(m_Telefonnummer, "-")
		
	}
	else If InStr(element, "Username")
	{
		m_test := []
		StringSplit, m_test, element,: ,
		m_Username := m_test2
	}
	else If InStr(element, "Password")
	{
		m_test := []
		StringSplit, m_test, element,: ,
		m_Password := m_test2
	}
}

;MsgBox % m_Fnamn . " med orgnummer: " . m_orgnummer . "`nHar adress: " . m_Adress . ", " . m_Ort . " - " . m_Postnummer . "`nBeställare: " . m_namn . "`nKontaktuppgifter:`n" . m_Telefonnummer . "`n" . m_E_postadress

GuiControl,, m_orgnummer, %m_orgnummer%
GuiControl,, m_fnamn, %m_Fnamn%
GuiControl,, m_namn, %m_namn%
GuiControl,, m_adress, %m_Adress%
GuiControl,, m_ort, %m_Ort%
GuiControl,, m_post, %m_Postnummer%
GuiControl,, m_nummer, %m_Telefonnummer%
GuiControl,, m_email, %m_E_postadress%
GuiControl,, m_Username, %m_Username%
GuiControl,, m_Password, %m_Password%

Menu, FileMenu, Add, Always on Top, MenuFileMenuAlwaysonTop
Menu, FileMenu, Add, Öppna Online, MenuFileMenuOppnaOnline
Menu, MyMenuBar, Add, File, :FileMenu
Menu, MyMenuBar, Add, Edit, MenuMyMenuBarEdit

Gui, Menu, MyMenuBar

Gui, Show, , Adminstratörs konto
Return

MenuMyMenuBarEdit:
	Edit
return

MenuFileMenuAlwaysonTop:
	Menu, FileMenu, ToggleCheck, Always on Top
	if alwaysontop
	{
		alwaysontop := 0
		WinSet, AlwaysOnTop, Off, Adminstratörs konto
	}
	else
	{
		alwaysontop := 1
		WinSet, AlwaysOnTop, On, Adminstratörs konto
	}

return

MenuFileMenuOppnaOnline:

BlockInput On

Run C:\Program Files (x86)\Internet Explorer\iexplore.exe http://ksintranet/menybox4/systemlankar.4.462f0578121d33754de80006585.html

WinWaitActive, Infobasen - Systemlänkar - Windows Internet Explorer, , 10
if ErrorLevel 
{
    MsgBox, WinWait timed out.
    BlockInput Off
    return
}
else

Winmove,Infobasen - Systemlänkar - Windows Internet Explorer,,,,1034,765
Sleep 500

Send ^{End}
Sleep 1000

MouseClick, Left, 259, 425
Sleep 2000

WinActivate Infobasen - Systemlänkar - Windows Internet Explore

Send ^{F4}
Sleep 1000

IfWinExist, ONLINE - Windows Internet Explorer 
{
    WinActivate ONLINE - Windows Internet Explorer
    sleep 200
    Winmove,ONLINE - Windows Internet Explorer,,,,1034,765
}

BlockInput Off
return

online_tilläggsavtal:

Gui, Submit
Gui, Show, , Adminstratörs konto

m_test := 0
m_test += 0, days

FormatTime, m_test, m_test, yyyy-MM-dd

WinActivate, ONLINE - Windows Internet Explorer, ,16
m_clipboard := clipboard
Suspend, on

Sleep 5000

clipboard := m_orgnummer

Send ^v
Sleep 200

Send {TAB}{TAB}

if( EF_Firma = 1)
	Send %A_Space%
Send {TAB}
Sleep 100

Send a975 {TAB}
Sleep 100

clipboard := m_test

Send ^v
Sleep 200

Send {ENTER}
Sleep 3000

MouseClick, Left, 97, 289
Sleep 5000

Send %m_namn%
Sleep 200
Send {TAB}

Send %m_Telefonnummer%
Sleep 200
Send {TAB}

Send %m_E_postadress%
Sleep 200

Send {ENTER}
Sleep 2000

Send f
Sleep 500

MouseClick, Left, 313, 287
Sleep 2000

clipboard := SubStr(m_namn, 1, InStr(m_namn, " ")-1)
Sleep 500
Send  ^v{TAB}
Sleep 500

clipboard := SubStr(m_namn, InStr(m_namn, " ") + 1, StrLen(m_namn) - InStr(m_nam, " "))
Sleep 500
Send  ^v{TAB}
Sleep 500

Send %m_Telefonnummer% {TAB}
Sleep 500 

clipboard := m_E_postadress
Sleep 500
Send ^v
Sleep 1000

Send {ENTER}
Sleep 500
Send {ENTER}
Sleep 500
Send {ENTER}
Sleep 500
Send {ENTER}
Sleep 1000

Send {TAB}
Sleep 300
Send Avtal skickas för underskrift
Sleep 1000
Send {TAB}
Sleep 300

Send Telenor Sverige AB
Sleep 1000
Send {TAB}

Send 0708-222222
Sleep 500
Send {TAB}

Send %m_mail%
Sleep 500
Send {TAB}

Send %m_name%
Sleep 500
Send {TAB}

Send %m_mail%
Sleep 500
Send {ENTER}
Sleep 1000

Send b
Sleep 500
Send {TAB}{TAB}{ENTER}
Sleep 3000

Send p
Sleep 500
Send {ENTER}

WinWait, PDFCreator 1.7.2,  ,16
Sleep 5000

Send {ENTER}
Sleep 2000

clipboard = H:\Desktop\%m_Fnamn% %m_orgnummer%.pdf
Sleep 1000
Send ^v
Sleep 1000
Send {ENTER}

Suspend, off

Return

online_avtal:

Gui, Submit
Gui, Show, , Adminstratörs konto

m_test := 0
m_test += 0, days

FormatTime, m_test, m_test, yyyy-MM-dd

WinActivate, ONLINE - Windows Internet Explorer, ,16
m_clipboard := clipboard
Suspend, on

Sleep 5000

Send %m_orgnummer%
Sleep 200

Send {TAB}{TAB}

if( EF_Firma = 1)
	Send %A_Space%
Send {TAB}
Sleep 100

Send a975 {TAB}
Sleep 100

Send %m_test%
Sleep 200

Send {ENTER}
Sleep 10000

Send %m_namn%
Sleep 200
Send {TAB}

Send %m_Telefonnummer%
Sleep 200
Send {TAB}

Send %m_E_postadress%
Sleep 200

Send {ENTER}
Sleep 1000

Send T {ENTER}
Sleep 1000

Send f
Sleep 500

MouseClick, Left, 313, 287
Sleep 300

Sleep 2000

clipboard := SubStr(m_namn, 1, InStr(m_namn, " ")-1)
Sleep 500
Send  ^v{TAB}
Sleep 500

clipboard := SubStr(m_namn, InStr(m_namn, " ") + 1, StrLen(m_namn) - InStr(m_nam, " "))
Sleep 500
Send  ^v{TAB}
Sleep 500


Send %m_Telefonnummer% {TAB}
Sleep 500 

clipboard := m_E_postadress
Sleep 500
Send ^v
Sleep 1000

Send {ENTER}
Sleep 500
Send {ENTER}
Sleep 500
Send {ENTER}
Sleep 500
Send {ENTER}
Sleep 1000

Send {TAB}
Sleep 300

clipboard := "Avtal skickas för underskrift"

Sleep 100

Send ^v
Sleep 500
Send {TAB}
Sleep 300

clipboard := "Telenor Sverige AB"

Sleep 100

Send ^v
Sleep 500
Send {TAB}

clipboard := "0708-222222"

Sleep 100

Send ^v 
Sleep 500
Send {TAB}

clipboard := m_mail

Sleep 100

Send ^v
Sleep 500
Send {TAB}

clipboard := m_name

Sleep 100

Send ^v
Sleep 500
Send {TAB}

clipboard := m_mail

Sleep 100

Send ^v
Sleep 500
Send {ENTER}
Sleep 1000

Send b
Sleep 500
Send {TAB}{TAB}{TAB}{ENTER}
Sleep 3000

Send p
Sleep 500
Send {ENTER}

WinWait, PDFCreator,  ,16
Sleep 2000

Send {ENTER}
Sleep 2000

clipboard := "H:\Desktop\Avtal - " . m_Fnamn . " " . m_orgnummer . ".pdf"

Sleep 100

Send ^v{ENTER}

clipboard := m_clipboard
Suspend, off

Return

GuiClose:
GuiEscape:
ExitApp