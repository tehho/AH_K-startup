
alwaysontop := 0

Gui, New, +Resize -MaximizeBox, Porteringsfullmakt

Gui, Add, Button, x10 y10 w100 h24, Generera
Gui, Add, DropDownList, vFormat x10 y40 w50, PDF||WAV
Gui, Add, Edit, vNummer x10 y70 w100, Nummer det g�ller
Gui, Add, DropDownList, vOperat�r x10 y100 w100, Qall||Teloteket|Fonia|SST Net|Fastcom|Tellit
Gui, Add, Edit, vSlutfaktura x10 y130 w100, Slutfak
GUi, Add, Edit, vKontaktnummer x10 y160 w100, Kontaktnr
GUi, Add, Edit, vNamn x10 y190 w100 r1, Namn p� f�retag/person
Gui, Add, Edit, VKontakt x10 y220 w100, Kontaktperson
Gui, Add, DateTime, V�ppnas x10 y250 w100,

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
	GuiControl,, Nummer, Nummer det g�ller
	GuiControl,, Slutfaktura, Slutfak
	GuiControl,, Kontaktnummer, Kontaktnr
	GuiControl,, Namn, Namn p� f�retag/person
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
		ret .= "Vi har f�rs�kt att n� dig g�llande en best�lld nummerflytt till en ny operat�r, " . Operat�r . ", och avslut av era abonnemang hos oss p� Telenor.`r`n"
	if InStr(Format, "PDF")
		ret .= "Nummerflytten �r inkommen med en fullmakt och �r underskriven av " . Kontakt . ".`r`n"
	else
		ret .= "Nummerflytten �r inkommen som en inspelning och �r godk�nd av " . Kontakt . ".`r`n`r`n"
	ret .= "Nummerflytten g�ller nummer " . Nummer . ".`r`n`r`n"
	ret .= "Eftersom det finns bindningstid kvar kommer du i samband med nummerflytten till den nya operat�ren f� resterande bindningstid p� en slutfaktura med en klumpsumma p� " . Slutfaktura . " kr.`r`n`r`n"
	ret .= "D� vi ej lyckats n� dig kommer vi nu att sl�ppa sp�rren f�r att nummerflytten skall g� igenom.`r`n"
	ret .= "�r det s� att ni vill avbryta nummerflytten till den nya operat�ren, ber vi er kontakta er nya operat�r f�r att avbryta flytten.`r`n"
	ret .= Operat�r . " kundservice: "
	if InStr(Operat�r, "Qall")
		ret .= "0771-400 100"
	else if InStr(Operat�r, "Teloteket")
		ret .= "0770-25 25 25"	
	else if InStr(Operat�r, "Fonia")
		ret .= "0770-221 221 "	
	else if InStr(Operat�r, "SST Net")
		ret .= "020 - 121 131"
	else if InStr(Operat�r, "Fastcom")
		ret .= "0771 - 18 40 50"
	else if InStr(Operat�r, "Tellit")
		ret .= "020 - 120 28 82"
	ret .= "`r`n`r`n"
	ret .= "Om allt �r i sin ordning �r det bara att ignorera detta meddelande s� kommer vi att avsluta era abonnemang och skicka en slutfaktura till er i samband med flytten.`r`n`r`n"
	ret .= "Ha en fortsatt trevlig dag!`r`n`r`n"
	ret .= "Med v�nliga h�lsningar`r`n`r`n"
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
		else if InStr(x, "G�ller")
		{
			GuiControl,, NUmmer,%value%
		}
		else if InStr(x, "Operat�r")
		{
			GuiControl,ChooseString, Operat�r,%value%
		}
		else if InStr(x, "Slutfaktura")
		{
			GuiControl,, Slutfaktura,%value%
		}
		else if InStr(x, "n�s p�")
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
		else if InStr(x, "�pnnas")
		{
			GuiControl,, �pnnas,%value%
		}
	}
	

	Gui, Show,, Porteringsfullmakt
return

MenuFileMenuGenerera:
ButtonGenerera:
	Gui, Submit
	ret := "Godk�nd Porteringsfullmakt format: " . Format 
	ret .= "`r`nG�ller nummer: " . Nummer 
	ret .= "`r`nOperat�r: " . Operat�r 
	ret .= "`r`nNummer till operat�r: "
	if InStr(Operat�r, "Qall")
		ret .= "0771-400 100"
	else if InStr(Operat�r, "Qall")
		ret .= "0771-400 100"	
	else if InStr(Operat�r, "Teloteket")
		ret .= "0770-25 25 25"	
	else if InStr(Operat�r, "Fonia")
		ret .= "0770-221 221 "	
	else if InStr(Operat�r, "SST Net")
		ret .= "020 - 121 131"	
	else if InStr(Operat�r, "Fastcom")
		ret .= "0771 - 18 40 50"
	else if InStr(Operat�r, "Tellit")
		ret .= "020 - 120 28 82"	
	ret .= "`r`nSlutfaktura: " . Slutfaktura
	ret .= "`r`nKund n�s p�: " . Kontaktnummer
	ret .= "`r`nNamn: " . Namn
	ret .= "`r`nKontaktperson: " . Kontakt

	FormatTime, Test, %�ppnas%, dd/MM/yy
	ret .= "`r`n�ppnas: " . Test
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