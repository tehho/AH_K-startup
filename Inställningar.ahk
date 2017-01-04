#SingleInstance on

if( not InStr( FileExist("H:\Inställningar"), "D") )
{
	FileCreateDir, H:\Inställningar
}

FileReadLine, SME_Bass1, H:\Inställningar\Startup settings.txt, 1
FileReadLine, SME_Bass2, H:\Inställningar\Startup settings.txt, 2

x := 10
y := 10
h := 30
w := 150
reset_x := x
reset_y := y
reset_w := w
reset_h := h

Gui, New, +Resize -MaximizeBox, Inställningar


settings := "x" . x . " y" . y . " h" h
Gui, Add, Button, %settings% gSave, Save

y := y + h + 5
Gui, Add, Tab2, x%x% y%y% w400, SME|SME BO

Gui, Tab,1

x := x + 5
y := y + 25


reset_x := x
reset_y := y

w := 70

settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, CheckBox, %settings% %SME_Bass1% vSME_Bass1, Bass1

x := x + w + 5
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, CheckBox, %settings% %SME_Bass2% vSME_Bass2, Bass2

x := x + w + 5
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, CheckBox, %settings% vSME_Chrome, Chrome


x := reset_x
y := y + h + 5

settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, CheckBox, %settings% vSME_Siebel, Siebel

x := x + w + 5
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, CheckBox, %settings% vSME_PartnerClient, Partner

x := x + w + 5
settings := "x" . x . " y" . y . " h" h . " w" . w 
Gui, Add, CheckBox, %settings% vSME_Internet, Internet

Gui,Tab,2

x := reset_x
y := reset_y
w := 100
settings := "x" . x . " y" . y . " w" . w
Gui, Add, DropDownList, %settings% gSMEBO_Mailmallen vSMEBO_Mailmallen_DDL, Svenska Hej||Svenska NPS|Svenska Hej då|Svenska Hej då helg|Engelska Hej|Engelska NPS|Engelska Hej då|Engelska Hej då helg

x := x + w + 5
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings% gSMEBO_Save, Save

x := reset_x
y := y + h + 5
w := (w * 3) + 5
settings := "x" . x . " y" . y . " w" . w 
Gui, Add, Edit, %settings% h150 vSMEBO_Mailmallen_edit, 


Menu, MyMenuBar, Add, Restart, RestartMenu
Menu, MyMenuBar, Add, Edit, EditMenu
Gui, Menu, MyMenuBar

Gui, Show

return

GuiClose:
GuiEscape:
ExitApp
return

RestartMenu:
	Reload
return

EditMenu:
	Edit
return

Test:
	MsgBox % "Test"
return

Test2:
	MsgBox % "Test2"
return

Save:

return


SMEBO_Mailmallen:
	Gui, Submit

	path := "H:\Inställningar\" . SMEBO_Mailmallen_DDL . ".txt"
	
	
	FileRead, tempstring, %path%

	if ErrorLevel
	{
		tempstring := "Error Loading: " . SMEBO_Mailmallen_DDL
	}

	GuiControl,, SMEBO_Mailmallen_edit, %tempstring%

	Gui, Show
return

SMEBO_Save:
	Gui, Submit

	path := "H:\Inställningar\" . SMEBO_Mailmallen_DDL . ".txt"

	FileDelete, %path%
	FileAppend, %SMEBO_Mailmallen_edit%, %path%
	if ErrorLevel
	{
		MsgBox % "Error: " . path . "`nTrying to append: " . SMEBO_Mailmallen_edit
	}

	Gui, Show
return

GetTitle()
{
	WinGetTitle, ret, "A"
	return ret
}