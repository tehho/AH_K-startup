;Main load
{
	;Defines
	{
		;WorkDir 
		WorkDir := "G:\SME BO\Autostart\mallar"
		;LoadDir 
		LoadDir := "H:\mallar"
		
		;NoteText
		NoteText := ""
		
		MallarList := ""

		
		Loop, %LoadDir%\*.txt
		{
			test := A_LoopFileName
			StringTrimRight, test, test, 4
			MallarList .= test . "|"
		}
		Loop, %WorkDir%\*.txt
		{
			test := A_LoopFileName
			StringTrimRight, test, test, 4
			MallarList .= test . "|"
		}
		StringTrimRight, addPhonesList, addPhonesList, 1
		
	}
	
	;Define Windows
	{
		
		Gui, Mallar:New, , Mallar
		
		x := 10
		y := 10
		w := 200
		h := 24

		Settings := "x" . x . " y" . y . " w" . w
		Gui, Add, Button, %Settings% gCopy, Kopiera
		y := y + 30 
		Settings := "x" . x . " y" . y . " w" . w
		Gui, Add, DropDownList, %Settings% Sort vMall gLoadMall, %MallarList%
		y := y + 30
		Settings := "x" . x . " y" . y . " w" . w
		Gui, Add, Edit, %Settings% r10 vMallEdit, 
		;RestartMenu
		Menu, MainMenu, Add, Restart, MainMenuRestart
		Menu, MainMenu, Add, Edit, MainMenuEdit
		
		;AddRestartMenu to Windows
		Gui, Mallar:Menu, MainMenu
	}
	Gui, Mallar:Show

return
}

;Start Functions
{
	;Menu
	{
		;MainMenuRestart Button
		MainMenuRestart:
		{
			Reload
			return
		}

		;MainMenuEdit Button
		MainMenuEdit:
		{
			Edit
			return
		}

	}
	
	;Windows
	{
		;Main Window
		{
		
			Copy:
				Gui,Submit
				
				path := workdir . "\" . Mall . ".txt"
				
				FileRead, test, %path%
				
				Clipboard := test

				Gui, Mallar:Show
			return

			LoadMall:
				Gui, Submit

				path := workdir . "\" . Mall . ".txt"
				
				FileRead, test, %path%

				GuiControl,Mallar:, MallEdit, %test%

				Gui, Mallar:Show
			return
		}
		
		;Sub Windows
		{
		
			
		
		}
	
	}
	
}