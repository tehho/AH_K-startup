
m_mobilftg := 0
m_kampanj := 0
m_sr := 0
m_sas := 0
m_överl := 0
m_portering := 0
m_skanska := 0

FileRead, m_mobilftg, H:\Köer\mobilftg.txt
FileRead, m_kampanj, H:\Köer\kampanj.txt
FileRead, m_sr, H:\Köer\sr.txt
FileRead, m_sas, H:\Köer\sas.txt
FileRead, m_överl, H:\Köer\överl.txt
FileRead, m_portering, H:\Köer\portering.txt
FileRead, m_skanska, H:\Köer\skanska.txt

m_mobilftg -= 1
Gui, New, +Resize -MaximizeBox +AlwaysOnTop, Counter

Gui, Add, Text, x10 y16 w60 h24, MobilFTG:
Gui, Add, Button, x80 y10 w60 h24, mobilftg+
Gui, Add, Button, x145 y10 w60 h24, mobilftg-
Gui, Add, Text, x210 y16 w20 vm_mobilftg, %m_mobilftg%
Gui, Add, Button, y10 w80 h24 x230, Clearmobilftg

Gui, Add, Text, x10 y46 w60 h24, Kampanj:
Gui, Add, Button, x80 y40 w60 h24, Kampanj+
Gui, Add, Button, x145 y40 w60 h24, Kampanj-
Gui, Add, Text, x210 y46 w20 vm_kampanj, %m_kampanj%
Gui, Add, Button, y40 w80 h24 x230, Clearkampanj

Gui, Add, Text, x10 y76 w60 h24, SR:
Gui, Add, Button, x80 y70 w60 h24, SR+
Gui, Add, Button, x145 y70 w60 h24, SR-
Gui, Add, Text, x210 y76 w20 vm_sr, %m_sr%
Gui, Add, Button, y70 w80 h24 x230, Clearsr

Gui, Add, Text, x10 y106 w60 h24, Sas:
Gui, Add, Button, x80 y100 w60 h24, sas+
Gui, Add, Button, x145 y100 w60 h24, sas-
Gui, Add, Text, x210 y106 w20 vm_sas, %m_sas%
Gui, Add, Button, y100 w80 h24 x230, Clearsas

Gui, Add, Text, x10 y136 w60 h24, Överlåtelse:
Gui, Add, Button, x80 y130 w60 h24, ÖV+
Gui, Add, Button, x145 y130 w60 h24, ÖV-
Gui, Add, Text, x210 y136 w20 vm_överl, %m_överl%
Gui, Add, Button, y130 w80 h24 x230, ClearÖV

Gui, Add, Text, x10 y166 w60 h24, Skanska:
Gui, Add, Button, x80 y160 w60 h24, Skanska+
Gui, Add, Button, x145 y160 w60 h24, Skanska-
Gui, Add, Text, x210 y166 w20 vm_skanska, %m_skanska%
Gui, Add, Button, y160 w80 h24 x230, ClearSkanska

Gui, Add, Button, y190 w80 h24 x230, ClearAll

Gui, Show,, Counter


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
	FileDelete, H:\Köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\Köer\kampanj.txt
return
Buttonkampanj-:
	global m_kampanj -= 1
	GuiControl,, m_kampanj, %m_kampanj%
	FileDelete, H:\Köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\Köer\kampanj.txt
return
ButtonClearkampanj:
	m_kampanj := 0
	GuiControl,, m_kampanj, %m_kampanj%
	FileDelete, H:\Köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\Köer\kampanj.txt

return

Buttonsr+:
	global m_sr += 1
	GuiControl,, m_sr, %m_sr%
	FileDelete, H:\Köer\sr.txt
	FileAppend, %m_sr%, H:\Köer\sr.txt
return
Buttonsr-:
	global m_sr -= 1
	GuiControl,, m_sr, %m_sr%
	FileDelete, H:\Köer\sr.txt
	FileAppend, %m_sr%, H:\Köer\sr.txt
return
ButtonClearsr:
	global m_sr := 0
	GuiControl,, m_sr, %m_sr%
	FileDelete, H:\Köer\sr.txt
	FileAppend, %m_sr%, H:\Köer\sr.txt

return

Buttonsas+:
	global m_sas += 1
	GuiControl,, m_sas, %m_sas%
	FileDelete, H:\Köer\sas.txt
	FileAppend, %m_sas%, H:\Köer\sas.txt
return
Buttonsas-:
	global m_sas -= 1
	GuiControl,, m_sas, %m_sas%
	FileDelete, H:\Köer\sas.txt
	FileAppend, %m_sas%, H:\Köer\sas.txt
return
ButtonClearsas:
	global m_sas := 0
	GuiControl,, m_sas, %m_sas%
	FileDelete, H:\Köer\sas.txt
	FileAppend, %m_sas%, H:\Köer\sas.txt

return

ButtonÖV+:
	global m_överl += 1
	GuiControl,, m_överl, %m_överl%
	FileDelete, H:\Köer\överl.txt
	FileAppend, %m_överl%, H:\Köer\överl.txt
return
ButtonÖV-:
	global m_överl -= 1
	GuiControl,, m_överl, %m_överl%
	FileDelete, H:\Köer\överl.txt
	FileAppend, %m_överl%, H:\Köer\överl.txt
return
ButtonClearÖV:
	global m_överl := 0
	GuiControl,, m_överl, %m_överl%
	FileDelete, H:\Köer\överl.txt
	FileAppend, %m_överl%, H:\Köer\överl.txt
return


ButtonSkanska+:
	global m_skanska += 1
	GuiControl,, m_skanska, %m_skanska%
	FileDelete, H:\Köer\skanska.txt
	FileAppend, %m_skanska%, H:\Köer\skanska.txt
return
ButtonSkanska-:
	global m_skanska -= 1
	GuiControl,, m_skanska, %m_skanska%
	FileDelete, H:\Köer\skanska.txt
	FileAppend, %m_skanska%, H:\Köer\skanska.txt
return
ButtonClearSkanska:
	global m_skanska := 0
	GuiControl,, m_skanska, %m_skanska%
	FileDelete, H:\Köer\skanska.txt
	FileAppend, %m_skanska%, H:\Köer\skanska.txt
return

ButtonClearAll:
	global m_skanska := 0
        global m_mobilftg := 0
        global m_kampanj := 0
        global m_sr := 0
        global m_överl := 0
        global m_skanska := 0

	GuiControl,, m_mobilftg, %m_mobilftg%
	FileDelete, H:\Köer\mobilftg.txt
	FileAppend, %m_mobilftg%, H:\Köer\mobilftg.txt

	GuiControl,, m_kampanj, %m_kampanj%
	FileDelete, H:\Köer\kampanj.txt
	FileAppend, %m_kampanj%, H:\Köer\kampanj.txt

	GuiControl,, m_sr, %m_sr%
	FileDelete, H:\Köer\sr.txt
	FileAppend, %m_sr%, H:\Köer\sr.txt

	GuiControl,, m_sas, %m_sas%
	FileDelete, H:\Köer\sas.txt
	FileAppend, %m_sas%, H:\Köer\sas.txt

	GuiControl,, m_överl, %m_överl%
	FileDelete, H:\Köer\överl.txt
	FileAppend, %m_överl%, H:\Köer\överl.txt

	GuiControl,, m_skanska, %m_skanska%
	FileDelete, H:\Köer\skanska.txt
	FileAppend, %m_skanska%, H:\Köer\skanska.txt
return


