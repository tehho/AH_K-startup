
m_mobilftg := 0
m_kampanj := 0
FileRead, m_mobilftg, H:\köer\mobilftg.txt
if errorlevel {
	FileCreateDir, H:\Köer
}
FileRead, m_kampanj, H:\köer\kampanj.txt

Gui, New, -MaximizeBox +AlwaysOnTop, Counter

Gui, Add, Text, x10 y16 w50 h24, MobilFTG:
Gui, Add, Button, x60 y10 w60 h24, mobilftg+
Gui, Add, Button, x125 y10 w60 h24, mobilftg-
Gui, Add, Text, x190 y16 w20 vm_mobilftg, %m_mobilftg%
Gui, Add, Button, y10 w80 h24 x210, Clearmobilftg

Gui, Add, Text, x10 y46 w50 h24, Kampanj:
Gui, Add, Button, x60 y40 w60 h24, Kampanj+
Gui, Add, Button, x125 y40 w60 h24, Kampanj-
Gui, Add, Text, x190 y46 w20 vm_kampanj, %m_kampanj%
Gui, Add, Button, y40 w80 h24 x210, Clearkampanj

Gui, Show, x300 y0 w300 h100, Counter


Buttonmobilftg+:
	global m_mobilftg += 1
	GuiControl,, m_mobilftg, %m_mobilftg%
	FileDelete, H:\Köer\mobilftg.txt
	FileAppend, %m_mobilftg%, H:\Köer\mobilftg.txt
return
Buttonmobilftg-:
	global m_mobilftg -= 1
	GuiControl,, m_mobilftg, %m_mobilftg%
	FileDelete, H:\Köer\mobilftg.txt
	FileAppend, %m_mobilftg%, H:\Köer\mobilftg.txt
return
ButtonClearmobilftg:
	m_mobilftg := 0
	GuiControl,, m_mobilftg, %m_mobilftg%
	FileDelete, H:\Köer\mobilftg.txt
	FileAppend, %m_mobilftg%, H:\Köer\mobilftg.txt

return

Buttonkampanj+:
	global m_kampanj += 1
	GuiControl,, m_kampanj, %m_kampanj%
	FileDelete, H:\köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\köer\kampanj.txt
return
Buttonkampanj-:
	global m_kampanj -= 1
	GuiControl,, m_kampanj, %m_kampanj%
	FileDelete, H:\köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\köer\kampanj.txt
return
ButtonClearkampanj:
	m_kampanj := 0
	GuiControl,, m_kampanj, %m_kampanj%
	FileDelete, H:\köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\köer\kampanj.txt

return

GuiClose:
ExitApp