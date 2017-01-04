Gui, New, +Resize -MaximizeBox, Starta program

x := 10
y := 10
w := 70
h := 24

settings := "x" . x . " y" . y . " w" . w . " h" . h

Gui, Add, Button, %settings%, Calc
x := x + w + 10
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings%, Visual
x := 10
y := y + 30
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings%, EFavtal
settings := "x" . x . " y" . y . " w" . w . " h" . h
x := x + w + 10
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings%, Råffe
settings := "x" . x . " y" . y . " w" . w . " h" . h
x := 10
y := y + 30
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings%, Navision
x := x + w + 10
settings := "x" . x . " y" . y . " w" . w . " h" . h
Gui, Add, Button, %settings%, Portering

Gui, Show,, Starta program

return

ButtonCalc:
	run, %windir%\system32\calc.exe
	ExitApp, 0
return 

ButtonVisual:
	Run C:\Program Files (x86)\Citrix\ICA Client\pnagent.exe /CitrixShortcut: (4) /QLaunch Ctxfarm65:VisualBASS62
	ExitApp, 0
return

ButtonEFavtal:
	Run C:\Program Files (x86)\Citrix\ICA Client\pnagent.exe /CitrixShortcut: (4) /QLaunch "Ctxfarm65:EF Avtal"
	ExitApp, 0
return

ButtonRåffe:
	Run C:\Program Files (x86)\Citrix\ICA Client\pnagent.exe /CitrixShortcut: (4) /QLaunch Ctxfarm65:Raffe
	ExitApp, 0
return
ButtonNavision:
	Run C:\Program Files (x86)\Citrix\ICA Client\pnagent.exe /CitrixShortcut: (4) /QLaunch "Ctxfarm65:Navision PROD"
	ExitApp, 0
return
ButtonPortering:
	Run G:\SME BO\Autostart\Porteringfullmakt.ahk
	ExitApp, 0
return


GuiClose:
GuiEscape:
	ExitApp
return