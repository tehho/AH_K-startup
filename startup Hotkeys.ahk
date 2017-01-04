
Suspend, off
FormatTime, Today0, , ddMMyyyy
FormatTime, Today, , d MMMM yyyy

EnvAdd, Yesterday, +90, days
FormatTime, Yesterday0, %Yesterday%, dd//MM//yyyy
FormatTime, Yesterday, %Yesterday%, d MMMM yyyy

If not WinExist("Prislistan.xlsx")
{
	if FileExist, "H:\Desktop\Prislistan.xlsx"
	{
		FileDelete, H:\Desktop\Prislistan.xlsx
	}

	sme := "http://ksintranet/menybox2/saljstod/saljstodsme.html"

	UrlDownLoadToFile, %sme%, H:\sme.tmp

	Loop, Read, H:\sme.tmp
	{
		if (InStr(A_LoopReadLine, "Prismatris") )
		{
			arr := StrSplit(A_LoopReadLine, "<")
			size := arr.Length()
			for i, x in arr
			{
				if (InStr(x, "Prismatris") && InStr(x, "href"))
				{
					pos1 := InStr(x, "href")
					pos2 := InStr(x, """", false, pos1+6)
					value := SubStr(x, pos1+6, pos2 - pos1 - 6)
					url := "http://ksintranet" . value
					;MsgBox % url
					UrlDownloadToFile, %url%, H:\Desktop\Prislistan.xlsx
					if(ErrorLevel || !FileExist("H:\Desktop\Prislistan.xlsx") ) 
					{
						msgbox, Download failed! %ErrorLevel%
					}
					else
					{
						If WinExist("Prislistan.xlsx")
							MsgBox, Exists
					}
				}
			}
			break
		}
	}

	
}
SetKeyDelay 20

�f := A910
m_�f := A975
m_name =
m_v�lkommen :=
m_npsl�nk =
m_haenbradag = 
m_haenbradaghelg = 
m_welcome :=
m_npslink =
m_haveaniceday = 
m_enter_divider := "&"
m_mail := "mobilftg@telenor.se"




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
		}
		else if InStr(value, "V�lkommen")
		{
			i++
			value := init_settings[i]
			m_v�lkommen := ""
			while not InStr(value, "@")
			{
				m_v�lkommen .= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_v�lkommen .= "`r`n"
				}
			}
		}
		else if InStr(value, "NPS_Svenska")
		{
			i++
			value := init_settings[i]
			m_npsl�nk :=
			while not InStr(value, "@")
			{
				m_npsl�nk .= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_npsl�nk .= "`r`n"
				}
			}
		}
		else if InStr(value, "Avslut_helg")
		{
			i++
			value := init_settings[i]
			m_haenbradaghelg := ""
			while not InStr(value, "@")
			{
				m_haenbradaghelg .= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_haenbradaghelg .= "`r`n"
				}
			}
		}
		else if InStr(value, "Avslut")
		{
			i++
			value := init_settings[i]
			m_haenbradag := ""
			while not InStr(value, "@")
			{
				m_haenbradag.= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_haenbradag.= "`r`n"
				}
			}
		}
		else if InStr(value, "Welcome")
		{
			i++
			value := init_settings[i]
			m_welcome := ""
			while not InStr(value, "@")
			{
				m_welcome .= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_welcome .= "`r`n"
				}
			}
		}
		else if InStr(value, "NPS_English")
		{
			i++
			value := init_settings[i]
			m_npslink :=
			while not InStr(value, "@")
			{
				m_npslink .= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_npslink .= "`r`n"
				}
			}
		}
		else if InStr(value, "End")
		{
			i++
			value := init_settings[i]
			m_haveaniceday := ""
			while not InStr(value, "@")
			{
				m_haveaniceday .= value
				i++
				value := init_settings[i]
				if(not InStr(value, "@"))
				{
					m_haveaniceday .= "`r`n"
				}
			}
		}
	}
	i++
}

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
m_secondclipboard :=
m_tab_delay = 300

RAlt & k::AltTab
RAlt & j::ShiftAltTab
RAlt & �::AltTab
RAlt & l::ShiftAltTab

^+m::

Gui, New, +Resize -MaximizeBox, Macro

Gui, Add, Edit, vm_path w100 x10 y10, �verl�telse
Gui, Add, Button, x120 y10, OK
Gui, Show,, Macro

return

#if not InStr(GetTitle(), "startup Hotkeys")

:*:.kons::konsument@telenor.se
:*:kons@::konsument@telenor.se
:*:kundftg::kundservice.foretag@telenor.se
::mobilftg::mobilftg@telenor.se
:*:.krg::kreditbedomning@telenor.se
:*:krg@::kreditbedomning@telenor.se
:*:smeavt::smeavtal@telenor.se
::lead::kontakt@telenor.se

:*:abdi.h::abdirahman.hussein@telenor.se
:*:andreas.a::andreas.antonsson@telenor.se
:*:chirstian.h::christian.henriksson@telenor.se
:*:dennis.k::dennis.karstrom@telenor.se
:*:emelie.j::emelie.johansson@sykes.com
:*:emma.m::emma.magnusson@telenor.se
:*:erik.t::erik.toshigawa@telenor.se
:*:filip.g::filip.gallnas@telenor.se
:*:jasmine.k::jasmine.kaye@telenor.se
:*:jesper.e::jesper.ekberg@telenor.se
:*:marcus.m::marcus.a.moller@telenor.se
:*:jonathan.v::jonathan.vallenbert@telenor.se
:*:marta.a::marta.astrom@telenor.se
:*:m�rta.a::marta.astrom@telenor.se
:*:marta.�::marta.astrom@telenor.se
:*:m�rta.�::marta.astrom@telenor.se
:*:sandra.k::sandra.karlsten@telenor.se

:*:.tlsd::axel.eriksson@sykes.com
:*:.tlteam11::martina.nyquist1@sykes.com
:*:.tlteam35::adam.jernberg@sykes.com
:*:.tlteam36::marina.maric@sykes.com
:*:.tlteam37::alexander.dimakis@sykes.com
:*:.tlteam38::axel.eriksson@sykes.com

#if not InStr(GetTitle(), "startup Hotkeys") and not InStr(GetTitle(), "prodbass")
:*:abg::abonnemang
#if not InStr(GetTitle(), "startup Hotkeys")
:*:abonnemagn::abonnemang
:*:abonnemnag::abonnemang
::efaktura::E-faktura
:*:teelnor::telenor
:*:telemor::telenor
:*:teelmor::telenor
:*:telnor::telenor
:*:telenmor::telenor
:*:teelfon::telefon
:*:telfeon::telefon
:*:telfon::telefon
::ftg::f�retag
:*:prv::privat
:*:mejl::mail
:*:fakadr::faktureringsadress

:*:enuf::enough

::pga::p� grund av
::iaf::i alla fall
::ialf::i alla fall
::samp::sampaketering
::sampas::sampaketering av sim
::iom::i och med
::.omg::omg�ende
::mvh::Med v�nliga h�lsningar
::dessv�re::dessv�rre
::itne::inte
::firmteck::firmatecknare
::frte::firmatecknare
:*:f�rl�nging::f�rl�ngning
:*:f�rl�gning::f�rl�ngning
:*:f�rl�gnig::f�rl�ngning
:*:upps�gnign::upps�gning
:*:upps�gnig::upps�gning
:*:upps�ging::upps�gning
:*:upps�gign::upps�gning
:*:yttligare::ytterligare
:*:ytterliggare::ytterligare
:*:orgnummer::organisationsnummer
:*:orgnumret::organisationsnumret
:*:afpak::aff�rspaket
:*:h�mskt::hemskt
:*:avlsuta::avsluta
::reko::rekommendation
:*:kompli::komple
:*:igne::igen
:*:�sknem�l::�nskem�l


#If InStr(GetTitle(), "Siebel")
::.d::

	m_clipboard := clipboard 

	sleep 100

	FormatTime, date, , d MMMM yyyy

	clipboard := date

	Send ^v

	sleep 100

	clipboard := m_clipboard 

return

#If InStr(GetTitle(), "prodbass")
::.d::

	m_clipboard := clipboard 

	sleep 100

	FormatTime, date, , dd/MM/yy

	clipboard := date

	Send !ri

	sleep 100
	
	clipboard := m_clipboard 

return

#If InStr(GetTitle(), "Online") or InStr(GetTitle(), "Save as")
:*:.d::

	m_clipboard := clipboard 

	sleep 100

	FormatTime, date, , yyyy-MM-dd


	clipboard := date

	Send ^v

	sleep 100
	
	clipboard := m_clipboard 

return

#if InStr(GetTitle(), "Chrome")
LControl & WheelUp::

	Send ^+{TAB}

return 
LControl & WheelDown::

	Send ^{TAB}

return 

#if 
LAlt & WheelUp::ShiftAltTab
LAlt & WheelDown::AltTab


::.�vsamma::

	m_clipboard := clipboard
	FileRead, clipboard, G:\SME BO\Autostart\mallar\�verl�telse - Samma.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard
return

::.�vprv::

	m_clipboard := clipboard

	FileRead, clipboard, G:\SME BO\Autostart\mallar\�verl�telse - F�retag till privat.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard
return

::.�vftg::

	m_clipboard := clipboard
	FileRead, clipboard, G:\SME BO\Autostart\mallar\�verl�telse - Privat till F�retag.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard
return

::.nummerflytt::

	m_clipboard := clipboard

	GetMallar("nummerflytt")

	clipboard := m_clipboard
return


::.ejbeh�rig::
	m_clipboard := clipboard
	FileRead, clipboard, G:\SME BO\Autostart\mallar\Storkundsh�nvisning.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard
return

::.nyportal::

	m_clipboard := clipboard
	FileRead, clipboard, G:\SME BO\Autostart\mallar\Best�llning Ftg.portal - nytecknande.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard

return

::.pdffaktura::
::.pdf-faktura::

	m_clipboard := clipboard
	FileRead, clipboard, G:\SME BO\Autostart\mallar\Faktura via mejl.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard

return

::.beg�ran::

	m_clipboard := clipboard 
	FileRead, clipboard, G:\SME BO\Autostart\mallar\Beg�ran.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard

return

::.portal::

	m_clipboard := clipboard
	FileRead, clipboard, G:\SME BO\Autostart\mallar\F�retagsportalen.txt
	Sleep 100
	Send ^v
	Sleep 100
	clipboard := m_clipboard

return

^+z::
	Suspend, Toggle	
return

#if
^+c::
	Suspend, on
	m_clipboard := clipboard
	if (InStr(GetTitle(), "prodbass") )
	{
		Click right, 100, 100
		if InStr(clipboard, ")")
			StringReplace, clipboard, clipboard, %A_SPACE%,,ALL
		StringReplace, clipboard, clipboard,),,ALL
		StringReplace, clipboard, clipboard,(,
		StringReplace, clipboard, clipboard,-,
	}
	else
	{
		Send {Ctrl down}c{Ctrl up}
	}
	
	global m_secondclipboard := clipboard
	
	clipboard := m_clipboard
	Suspend, off
return

^+v::
	Suspend, on
	m_clipboard := clipboard


	global m_secondclipboard
	clipboard := m_secondclipboard 

	if (InStr(GetTitle(), "prodbass") )
	{
		Send !ri
	}
	else
	{
		Send {Ctrl down}v{Ctrl up}
	}
	
	clipboard := m_clipboard
	Suspend, off
return


!+v::
	Suspend, on
	m_clipboard := clipboard


	arr := StrSplit(clipboard, "`r`n")
	
	for i, x in arr
	{
		;MsgBox % x . " is " . i
	}
	clipboard := SubStr(arr[3], 1, InStr(arr[3], "/") - 1)

	Sleep 250	
	Send ^v{TAB}
	Sleep 250
	clipboard := arr[1]
	Send ^v{TAB}
	Sleep 250
	clipboard := arr[4]
	Send ^v{TAB}
	Sleep 250

	clipboard := m_clipboard
	Suspend, off
return

^!e::
	Edit
return


#if InStr(GetTitle(), "Navision")
^c::
{
	Suspend, on
	
	Send ^c

	Sleep 100

	clipboard := RTrim(clipboard)
	

	Sleep 100

	Suspend, off
}
return

^v::
{
	Suspend, on

	clipboard := Trim(clipboard)
	
	Sleep 100

	Send ^v

	Suspend, off
	
	
}
return


#If InStr(GetTitle(), "prodbass")
WheelDown::
	Send {PgDn}
return

WheelUp::
	Send {PgUp}
return
^f::
	WinGet, m_id, ID, A
	CoordMode, Mouse, Screen
	MouseGetPos, m_X, m_y
	m_X := m_x - 100
	m_y := m_y - 50
	
	CoordMode, Mouse, Window
	InputBox, m_value, Search, , , 200, 100, %m_X%, %m_y%

	if( m_value == "" )
	{
		return
	}
	m_clipboard := clipboard
	WinActivate, ahk_id %m_id%
	Sleep 500

	CopyAreaBass(10,50, 650, 440)
	return
	if ( InStr(clipboard, m_value) )
	{
		MsgBox, Found!
		return
	}
	else
	{
		Sleep 100
		Send {PGDN}
		Sleep 100
		CopyAreaBass(12, 400, 206, 8)
		if( InStr(clipboard, "033 - BROWSING NOT ALLOWED") )
		{
			MsgBox, No find, No scrolling enabled!
			return
		}
		else
		{
			last_clipboard := clipboard
			CopyAreaBass(10,50, 600, 440)
			Sleep 100
			while ( clipboard != last_clipboard )
			{
				if ( InStr(clipboard, m_value) )
				{
					MsgBox, Found!
					return
				}
				if ( InStr(clipboard, "GS_NOTE3") )
				{
					Send {PGDN}
				}
				else
				{	
					Send {PGUP}
				}
				last_clipboard := clipboard
				CopyAreaBass(10,50, 600, 440)
			}
		}
		MsgBox, No find
	}
	clipboard := m_clipboard
return

#if InStr(GetTitle(), "Excel - test")
^C::

	Suspend, on

	Send ^c
	
	Sleep 100

	Send {Alt down}

	Sleep 100

	Send {Tab}

	Sleep 100

	Send {Alt up}

	Sleep 100
	
	Send !ri{RIGHT}

	Sleep 100

	CopyAreaBass(140, 336, 70, 12)

	Sleep 100

	Send {ESC}{ESC}

	Sleep 100

	Send {Alt down}

	Sleep 100

	Send {Tab}

	Sleep 100

	Send {Alt up}

	Sleep 100

	Send {RIGHT}^v{DOWN}{LEFT}

	Sleep 100

	Suspend, off

return

:*:dummy::
	Send 60000214{ENTER}{ENTER}3{ENTER}{TAB}1{ENTER}
return

:*:020`nn`n::
	Send 20{ENTER}a{ENTER}s{ENTER}{ENTER}{ENTER}n{ENTER}{ENTER}{ENTER}{ENTER}{ENTER}y{ENTER}
return

:*:o20`ne`n::
	Send 20{ENTER}a{ENTER}s{ENTER}{ENTER}{ENTER}e{ENTER}!ri{ENTER}{ENTER}{ENTER}{ENTER}y{ENTER}
return

#if InStr(GetTitle(), "Siebel") or InStr(GetTitle(), "Send Email")
^d::

Sleep 500

Suspend, on

m_temp_c := clipboard

Send {shift down}
Sleep %m_tab_delay%
Send {END}
Sleep %m_tab_delay%
Send {shift up}
Sleep %m_tab_delay%
Send ^c
Sleep %m_tab_delay%
Send {HOME}
if InStr(clipboard, "Thread")
{
	m_thread_id := StrSplit(clipboard, "ID:")
	m_thread_id := m_thread_id[2]
	m_thread_id := StrReplace(m_thread_id, "]")
}
else
{
	m_thread_id := 0
}

_test = %m_V�lkommen%`r`n`r`n`r`n

if (m_thread_id != 0)
{
	_test = %_test%`r`n%m_npsl�nk%`r`nhttps://response.easyresearch.se/s.asp?WID=999476&Pwd=15768943&foreignid=%m_thread_id%`r`n
}

FormatTime, day, ,ddd


if(day == "fr" or day == "l�")
{
	_test = %_test%%m_haenbradaghelg%
}
else
{
	_test = %_test%%m_haenbradag%
}

clipboard := _test

Sleep %m_tab_delay%
Send ^v

Sleep %m_tab_delay%
Send ^s
Sleep %m_tab_delay%

clipboard := m_temp_c


Suspend, off

Return

^e::

Sleep 500

Suspend, on

m_temp_c := clipboard

Send {shift down}
Sleep %m_tab_delay%
Send {END}
Sleep %m_tab_delay%
Send {shift up}
Sleep %m_tab_delay%
Send ^c
Sleep %m_tab_delay%
Send {HOME}
if InStr(clipboard, "Thread")
{
	m_thread_id := StrSplit(clipboard, "ID:")
	m_thread_id := m_thread_id[2]
	m_thread_id := StrReplace(m_thread_id, "]")
}
else
{
	m_thread_id := 0
}

_test = %m_welcome%`r`n`r`n`r`n

if (m_thread_id != 0)
{
	_test = %_test%`r`n%m_npslink%`r`nhttps://response.easyresearch.se/s.asp?WID=999476&Pwd=15768943&foreignid=%m_thread_id%`r`n
}
_test = %_test%%m_haveaniceday%

clipboard := _test

Sleep %m_tab_delay%
Send ^v

Sleep %m_tab_delay%
Send ^s
Sleep %m_tab_delay%

clipboard := m_temp_c


Suspend, off

Return

#if InStr(GetTitle(), "prodbass") or InStr(GetTitle(), "EF-Avtal")
^v::
Title := GetTitle()
If InStr(Title, "prodbass")
{
	Send !ri
}
else If InStr(Title, "EF-Avtal")
{
	StringReplace, clipboard, clipboard, -
	Suspend, on
	Sleep 100
	Send ^v
	Suspend, off
}

Return

#If InStr(GetTitle(), "prodbass")
^c::

Click right, 100, 100
if InStr(clipboard, ")")
	StringReplace, clipboard, clipboard, %A_SPACE%,,ALL
StringReplace, clipboard, clipboard,),,ALL
StringReplace, clipboard, clipboard,(,,ALL
StringReplace, clipboard, clipboard,-,

Return


#If InStr(GetTitle(), "EF-Avtal")
!s::
	clipboard =

	Send ^c
	Sleep 200
	clipboard := StrReplace(clipboard, " ")
	m_kp_name := clipboard
	clipboard =

	Send {TAB}
	Sleep 200
	Send ^c
	Sleep 200
	clipboard := StrReplace(clipboard, " ")
	m_kp_name := m_kp_name . " " . clipboard
	clipboard =

	Send {TAB}{TAB}{TAB}{TAB}
	Sleep 200
	Send ^c
	Sleep 200
	clipboard := StrReplace(clipboard, " ")
	m_kp_number := clipboard
	clipboard =
	
	Send {TAB}
	Sleep 200
	Send ^c
	Sleep 200
	clipboard := StrReplace(clipboard, " ")
	m_kp_email := clipboard
	
	clipboard = %m_kp_name%
	if(m_kp_number != "" and not InStr(m_kp_email, "Saknas") and m_kp_email != "")
	{
		clipboard = %clipboard%, %m_kp_number%, %m_kp_email%,
	}
	else if (m_kp_number != "")
	{
		clipboard = %clipboard%, %m_kp_number%,
	}
	else if not InStr(m_kp_email, "Saknas")
	{
		StringReplace, m_kp_email,m_kp_email,%A_SPACE%,,ALL
		clipboard = %clipboard%, %m_kp_email%,
	}
	else
	{
		clipboard = %clipboard%, inga kontaktuppgifter,
	}

Return

#If
!^u::
FileCopy, G:\SME BO\Autostart\startup Hotkeys.ahk, H:\startup Hotkeys.ahk, 1

MsgBox, Uppdatering klar.
Reload

Return

!^z::

Run, G:/SME BO/Autostart/Starter.ahk

return

!^w::
Run, G:\SME BO\Autostart\startup F�retagsavtal.ahk 
Return

#If
!^n::
Gui, New, +Resize -MaximizeBox, Navision
Gui, Add, Text, w200, Kopy pasta Navision Order
Gui, Add, Button, Default x10 y24, Generera_Navision
Gui, Add, Button, x120 y24, Navision

Gui, Add, Text, x10 y60 w80,Orgnummer:
Gui, Add, Edit, vm_orgnummer x100 y60 w100 h20,
Gui, Add, Text, vm_t_orgnummer x210 y60 w100 h20,

Gui, Add, Text, x10 y80 w80,F�retagsnamn:
Gui, Add, Edit, vm_fnamn x100 y80 w100,
Gui, Add, Text, vm_t_fnamn x210 y80 w100 h20,

Gui, Add, Text, x10 y100 w80,Kontaktperson:
Gui, Add, Edit, vm_namn x100 y100 w100,
Gui, Add, Text, vm_t_namn x210 y100 w100 h20,

Gui, Add, Text, x10 y120 w80,Adress:
Gui, Add, Edit, vm_adress x100 y120 w100,
Gui, Add, Text, vm_t_adress x210 y120 w100 h20,

Gui, Add, Text, x10 y140 w100,Ort:
Gui, Add, Edit, vm_ort x100 y140 w100,
Gui, Add, Text, vm_t_ort x210 y140 w100 h20,

Gui, Add, Text, x10 y160 w100,Postnummer:
Gui, Add, Edit, vm_post x100 y160 w100,
Gui, Add, Text, vm_t_post x210 y160 w100 h20,

Gui, Add, Text, x10 y180 w100,Kontaktnummer:
Gui, Add, Edit, vm_nummer x100 y180 w100,
Gui, Add, Text, vm_t_nummer x210 y180 w100 h20,

Gui, Add, Text, x10 y200 w100,E-post:
Gui, Add, Edit, vm_email x100 y200 w100,
Gui, Add, Text, vm_t_email x210 y200 w100 h20,


Gui, Add, Text, x10 y220 w100,Numret:
Gui, Add, Edit, vm_number x100 y220 w100,
Gui, Add, Text, vm_t_number x210 y220 w100 h20,

Gui, Add, Text, x10 y240 w100,Subsid:
Gui, Add, Edit, vm_subsid x100 y240 w100,
Gui, Add, Text, vm_t_subsid x210 y240 w100 h20,

Gui, Show, W350 H400 , Navision Order
Return

#If
!^r::
MsgBox, Reloading Script`!
Reload

Return

ButtonGenerera_Navision:
Gui, Submit


GuiControl,, m_t_orgnummer, %m_orgnummer%
GuiControl,, m_t_fnamn, %m_Fnamn%
GuiControl,, m_t_namn, %m_namn%
GuiControl,, m_t_adress, %m_Adress%
GuiControl,, m_t_ort, %m_Ort%
GuiControl,, m_t_post, %m_Postnummer%
GuiControl,, m_t_nummer, %m_Telefonnummer%
GuiControl,, m_t_email, %m_E_postadress%
GuiControl,, m_t_number, %m_number%
GuiControl,, m_t_subsid, %m_subsid%


Gui, Show, , Navision Order

Return

ButtonNavision:

WinGet, Windows, List

id :=

Loop %Windows%
{
	WinGetTitle, TVar, % "ahk_id " Windows%A_Index%
	if InStr(TVar, "Solutions-Navision")
	{
		id := Windows%A_Index%
	}
}

;MsgBox % id

WinActivate, ahk_id %id%

WinWait, A, , 3

Send {F3}
Sleep 100
Send {ENTER}
Sleep 100
Send +{TAB}
Sleep 100
Send ^c
Sleep 100
m_ordernummer = clipboard

Send {TAB}49000956{ENTER}
Sleep 100
Send {LEFT}{ENTER}

Sleep 100
Send {Shift down}
Sleep 100
Send {TAB}{TAB}{TAB}{TAB}{TAB}
Sleep 100
Send {Shift up}

clipboard := m_fnamn
Sleep 100

Send ^v{ENTER}
Sleep 100

clipboard := m_adress
Sleep 100

Send ^v{ENTER}{ENTER}
Sleep 100

clipboard := m_Postnummer
Sleep 100

Send ^v{ENTER}
Sleep 100

clipboard := ""

Send ^c

if clipboard == ""
{
	clipboard := m_Ort
	Sleep 100
	Send ^v
	Sleep 100
}
Send {TAB}{TAB}{TAB}

clipboard := m_namn
Sleep 100
Send ^v{ENTER}{ENTER}{ENTER}{ENTER}{ENTER}{ENTER}{ENTER}{ENTER}
Sleep 100

Return


^!h::

MsgBox, Hj�lp lista:`r`n`r`nCtrl+Alt+R: Ladda om skriptet, h�mtar nya inst�llningar ifr�n H:\Settings.txt`r`n`r`nCtrl+Alt+U: Uppdaterar ditt skript till det senaste ifr�n G:\SME BO\Autostart`r`n`r`nWindows+D: Skriver Automeddelande i siebel.`r`n`r`nAlt+S: Skapar en mall med kontaktinfo f�r kp.`r`n`r`nCtrl+V: Fungerar i BASS.`r`n`r`nCtrl+ALt+W: F�retagsportalen mallen.`r`n`r`nCtrl+Alt+Q

Return

#if InStr(GetTitle(), "PROIV")
Enter::
NumpadEnter::

	Click 747, 219

return
#if

CopyAreaBass(x,y,w,h)
{
	temp_x := x
	temp_y := y
	Click down, %temp_x%, %temp_y%
	temp_w := x + w
	temp_h := y + h
	Click up, %temp_w%, %temp_h%
	Click right, %temp_x%, %temp_y%

	;MsgBox, %temp_x% %temp_y%, %temp_w% %temp_h%
}



Get_ID_List()
{
	WinGet, Title, List
	ret := []
	Loop, %Title%
	{
		temp_id := Title%A_Index%
		WinGetTitle, temp_title ,ahk_id %temp_id%
		if InStr(temp_title, "prodbass")
		{
			ret.Push(temp_id)
		}
	}
	Return ret
}


CreateLoadFile()
{
	FileDelete, H:\Settings_bass.txt

	temp_id := Get_ID_List()

	for i, id in temp_id
	{
		FileAppend, Bass%i%: %id%`r`n, H:\Settings_bass.txt
	}
	Return
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

GetMallar(fileName)
{
	FileRead, clipboard, G:\SME BO\Autostart\mallar\%fileName%.txt
	Sleep 100
	Send ^v
	Sleep 100
}