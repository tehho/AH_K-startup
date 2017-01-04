
alwaysontop := 0

Gui, New, +Resize -MaximizeBox, Porteringsfullmakt

Gui, Add, Button, x10 y10 w100 h24, Generera
Gui, Add, DropDownList, vFormat x10 y40 w50, PDF||WAV
Gui, Add, Edit, vNummer x10 y70 w100, Nummer det gäller
Gui, Add, DropDownList, vOperatör x10 y100 w100, Qall||Teloteket|Fonia|SST Net|Fastcom|Tellit
Gui, Add, Edit, vSlutfaktura x10 y130 w100, Slutfak
GUi, Add, Edit, vKontaktnummer x10 y160 w100, Kontaktnr
GUi, Add, Edit, vNamn x10 y190 w100 r1, Namn på företag/person
Gui, Add, Edit, VKontakt x10 y220 w100, Kontaktperson
Gui, Add, DateTime, VÖppnas x10 y250 w100,

Menu, FileMenu, Add, Generera`tCtrl+G, MenuFileMenuGenerera
Menu, FileMenu, Add, Generera SMS`tCtrl+S, MenuFileMenuGenereraSMS
Menu, FileMenu, Add, Generera Text`tCtrl+T, MenuFileMenuGenereraText
Menu, FileMenu, Add, Restart, MenuFileMenuRestart
Menu, FileMenu, Add, Always on Top, MenuFileMenuAlwaysonTop
Menu, MyMenuBar, Add, File, :FileMenu
Menu, MyMenuBar, Add, Restart, MenuFileMenuRestart
Menu, MyMenuBar, Add, Edit, MenuFileMenuEdit

Gui, Menu, MyMenuBar

Gui, Show,, Porteringsfullmakt

return

GuiClose:
	ExitApp
return

GuiEscape:
	GuiControl,, Nummer, Nummer det gäller
	GuiControl,, Slutfaktura, Slutfak
	GuiControl,, Kontaktnummer, Kontaktnr
	GuiControl,, Namn, Namn på företag/person
	GuiControl,, Kontakt, Kontaktperson

	Gui, Show
return

MenuFileMenuAlwaysonTop:
	Menu, FileMenu, ToggleCheck, Always on Top
	if alwaysontop
	{
		alwaysontop := 0
		WinSet, AlwaysOnTop, Off, Porteringsfullmakt
	}
	else
	{
		alwaysontop := 1
		WinSet, AlwaysOnTop, On, Porteringsfullmakt
	} 

return

MenuFileMenuRestart:
	Reload
return 

MenuFileMenuEdit:
	Edit
return

MenuFileMenuGenereraSMS:
	Gui, Submit
	
	pos := InStr(Kontakt, " ") - 1
	StringLeft, fornamn, Kontakt, pos

	ret := "Hej " . fornamn . ",`r`n" 
		ret .= "Vi har försökt att nå dig gällande en beställd nummerflytt till en ny operatör, " . Operatör . ", och avslut av era abonnemang hos oss på Telenor.`r`n"
	if InStr(Format, "PDF")
		ret .= "Nummerflytten är inkommen med en fullmakt och är underskriven av " . Kontakt . ".`r`n"
	else
		ret .= "Nummerflytten är inkommen som en inspelning och är godkänd av " . Kontakt . ".`r`n`r`n"
	ret .= "Nummerflytten gäller nummer " . Nummer . ".`r`n`r`n"
	ret .= "Eftersom det finns bindningstid kvar kommer du i samband med nummerflytten till den nya operatören få resterande bindningstid på en slutfaktura med en klumpsumma på " . Slutfaktura . " kr.`r`n`r`n"
	ret .= "Då vi ej lyckats nå dig kommer vi nu att släppa spärren för att nummerflytten skall gå igenom.`r`n"
	ret .= "Är det så att ni vill avbryta nummerflytten till den nya operatören, ber vi er kontakta er nya operatör för att avbryta flytten.`r`n"
	ret .= Operatör . " kundservice: "
	if InStr(Operatör, "Qall")
		ret .= "0771-400 100"
	else if InStr(Operatör, "Teloteket")
		ret .= "0770-25 25 25"	
	else if InStr(Operatör, "Fonia")
		ret .= "0770-221 221 "	
	else if InStr(Operatör, "SST Net")
		ret .= "020 - 121 131"
	else if InStr(Operatör, "Fastcom")
		ret .= "0771 - 18 40 50"
	else if InStr(Operatör, "Tellit")
		ret .= "020 - 120 28 82"
	ret .= "`r`n`r`n"
	ret .= "Om allt är i sin ordning är det bara att ignorera detta meddelande så kommer vi att avsluta era abonnemang och skicka en slutfaktura till er i samband med flytten.`r`n`r`n"
	ret .= "Ha en fortsatt trevlig dag!`r`n`r`n"
	ret .= "Med vänliga hälsningar`r`n`r`n"
	ret .= "Telenor Kundservice"

	clipboard := ret

	Gui, Show,, Porteringsfullmakt
return

MenuFileMenuGenereraText:
	
	array := StrSplit(clipboard, "`r`n")
	
	For i, x in array
	{
		temp := StrSplit(x, ":")
		value := Trim(temp[2])
		if InStr(x, "format")
		{
			GuiControl,ChooseString, Format,%value%
		}
		else if InStr(x, "Gäller")
		{
			GuiControl,, NUmmer,%value%
		}
		else if InStr(x, "Operatör")
		{
			GuiControl,ChooseString, Operatör,%value%
		}
		else if InStr(x, "Slutfaktura")
		{
			GuiControl,, Slutfaktura,%value%
		}
		else if InStr(x, "nås på")
		{
			GuiControl,, Kontaktnummer,%value%
		}
		else if InStr(x, "Namn")
		{
			GuiControl,, Namn,%value%
		}
		else if InStr(x, "Kontaktperson")
		{
			GuiControl,, Kontakt,%value%
		}
		else if InStr(x, "Öpnnas")
		{
			GuiControl,, Öpnnas,%value%
		}
	}
	

	Gui, Show,, Porteringsfullmakt
return

MenuFileMenuGenerera:
ButtonGenerera:
	Gui, Submit
	ret := "Godkänd Porteringsfullmakt format: " . Format 
	ret .= "`r`nGäller nummer: " . Nummer 
	ret .= "`r`nOperatör: " . Operatör 
	ret .= "`r`nNummer till operatör: "
	if InStr(Operatör, "Qall")
		ret .= "0771-400 100"
	else if InStr(Operatör, "Qall")
		ret .= "0771-400 100"	
	else if InStr(Operatör, "Teloteket")
		ret .= "0770-25 25 25"	
	else if InStr(Operatör, "Fonia")
		ret .= "0770-221 221 "	
	else if InStr(Operatör, "SST Net")
		ret .= "020 - 121 131"	
	else if InStr(Operatör, "Fastcom")
		ret .= "0771 - 18 40 50"
	else if InStr(Operatör, "Tellit")
		ret .= "020 - 120 28 82"	
	ret .= "`r`nSlutfaktura: " . Slutfaktura
	ret .= "`r`nKund nås på: " . Kontaktnummer
	ret .= "`r`nNamn: " . Namn
	ret .= "`r`nKontaktperson: " . Kontakt

	FormatTime, Test, %Öppnas%, dd/MM/yy
	ret .= "`r`nÖppnas: " . Test
	ret .= "`r`n"
	clipboard := ret
	Gui, Show,, Porteringsfullmakt

return

#if InStr(GetTitle(), "prodbass")
:*:o34`n::
	m_clipboard := clipboard
	Sleep 100
	date := GetNextDate()
	FormatTime, clipboard, %date% , dd/MM/yyyy
	Sleep 100
	Send 34{ENTER}
	Sleep 100
	Send {RIGHT}!ri{ENTER}{F11}
	Sleep 100
	clipboard := m_clipboard
Return


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