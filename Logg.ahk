;Main load
{
	;Defines
	{
		;WorkDir 
		WorkDir := "H:\Desktop\logg"
		;LoadDir 
		
		x := 10
		y := 10
		w := 100
		h := 24
		
	}
	
	;Define Windows
	{
		Gui, Notes:New
		Gui, NotesAdd:New
		Gui, NotesAddGross:New
		Gui, NotesAddFul:New
		Gui, NotesAddMånterm:New

		
		
		
		;MainNoteWindow Row1
		{
			x := 10
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, Notes:Add, Button, %settings% gNotesAdd, Logg
			
			x := x + 110
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, Notes:add, Button, %settings% gNotesGetInfo, Hämta info
			y := y + 30
			w := 300
			x := 10
			settings := "x" . x . " y" . y . " w" . w
			Gui, Notes:Add, Edit, %settings% r10 vNote,
		}
		
		;AddNoteWindow
		{
			x := 10
			y := 10
			w := 200
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAdd:Add, Button, %settings% gNotesAddSave Default, Save
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAdd:Add, Edit, %settings% vNotesAddName, Namn
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAdd:Add, Edit, %settings% r10 vNotesAddText, %NoteText%
		}
		
		;AddGrossNoteWindow
		{
			x := 10
			y := 10
			w := 200
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddGross:Add, Button, %settings% gNotesAddGrossSave Default, Save Gross
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddGross:Add, DropDownList, %settings% Choose1 gNotesAddGrossAbgType vNotesAddGrossAbgType, Vanlig||OSUB|BAS
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddGross:Add, DropDownList, %settings% vNotesAddGrossAbgValue, 1 GB|5 GB||30 GB|100 GB|200 GB
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddGross:Add, Edit, %settings% vNotesAddGrossName, Noteringens namn
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddGross:Add, Edit, %settings% vNotesAddGrossOrgnummer, Orgnummer
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddGross:Add, Edit, %settings% vNotesAddGrossKnummer, Kontakt nummer
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddGross:Add, Edit, %settings% vNotesAddGrossKnamn, Kontakt person
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddGross:Add, DropDownList, %settings% vNotesAddGrossPhone Sort gNotesAddGrossPhoneUpdate, %addPhonesList%
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddGross:Add, DropDownList, %settings% vNotesAddGrossColor Sort,
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddGross:Add, Edit, %settings% r10 vNotesAddGrossText, %NoteText%
		}
		
		;AddFörlängningNoteWindow
		{
			x := 10
			y := 10
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddFul:Add, Button, %settings% gNotesAddFulSave Default, Save Förlängning
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddFul:Add, DropDownList, %settings% Choose1 gNotesAddFulAbgType vNotesAddFulAbgType, Vanlig||OSUB|BAS
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddFul:Add, DropDownList, %settings% vNotesAddFulAbgValue, 1 GB|5 GB||30 GB|100 GB|200 GB
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddFul:Add, Edit, %settings% vNotesAddFulName, Noteringens namn
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddFul:Add, Edit, %settings% vNotesAddFulOrgnummer, Orgnummer
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddFul:Add, Edit, %settings% vNotesAddFulNummer, Numret det gäller
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddFul:Add, Edit, %settings% vNotesAddFulKnummer, Kontakt nummer
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w . " h" . h
			Gui, NotesAddFul:Add, Edit, %settings% vNotesAddFulKnamn, Kontakt person
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddFul:Add, DropDownList, %settings% vNotesAddFulPhone Sort gNotesAddFulPhoneUpdate, %addPhonesList%
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddFul:Add, DropDownList, %settings% vNotesAddFulColor Sort,
			y := y + 30
			settings := "x" . x . " y" . y . " w" . w
			Gui, NotesAddFul:Add, Edit, %settings% r10 vNotesAddFulText, %NoteText%
		}
		
		;AddMåntermNoteWindow
		{
			Gui, NotesAddMånterm:Add, Button, x10 y10 %addWindowWidth% h24 gNotesAddMåntermSave Default, Save Månterm2
			Gui, NotesAddMånterm:Add, Edit, x10 y40 %addWindowWidth% h24 vNotesAddMåntermName, Noteringens namn
			Gui, NotesAddMånterm:Add, Edit, x10 y70 %addWindowWidth% h24 vNotesAddMåntermOrgnummer, Orgnummer
			Gui, NotesAddMånterm:Add, Edit, x10 y100 %addWindowWidth% h24 vNotesAddMåntermNummer, Numret det gäller
			Gui, NotesAddMånterm:Add, Edit, x10 y130 %addWindowWidth% h24 vNotesAddMåntermKnummer, Kontakt nummer
			Gui, NotesAddMånterm:Add, Edit, x10 y160 %addWindowWidth% h24 vNotesAddMåntermKnamn, Kontakt person
			Gui, NotesAddMånterm:Add, DropDownList, x10 y190 %addWindowWidth% vNotesAddMåntermPhone Sort gNotesAddMåntermPhoneUpdate, %addPhonesList%
			Gui, NotesAddMånterm:Add, DropDownList, x10 y220 %addWindowWidth% vNotesAddMåntermColor Sort,
			Gui, NotesAddMånterm:Add, Edit, x10 y230 %addWindowWidth% r10 vNotesAddMåntermText, %NoteText%
		}
		
		;RestartMenu
		Menu, MainMenu, Add, Restart, MainMenuRestart
		Menu, MainMenu, Add, Edit, MainMenuEdit

		
		;AddRestartMenu to Windows
		Gui, Notes:Menu, MainMenu
		Gui, NotesAdd:Menu, MainMenu
		Gui, NotesAddGross:Menu, MainMenu
		Gui, NotesAddFul:Menu, MainMenu
		Gui, NotesAddMånterm:Menu, MainMenu
	}
	
	;Check if WorkDir exists load dir else create dir
	{
		If( InStr( FileExist(WorkDir), "D") )
		{
			path := WorkDir . "\Gross"
			If( not InStr( FileExist(path), "D") )
			{
				FileCreateDir, %path%
			}
			path := WorkDir . "\Fulfilment"
			If( not InStr( FileExist(path), "D") )
			{
				FileCreateDir, %path%
			}
			path := WorkDir . "\Månterm2"
			If( not InStr( FileExist(path), "D") )
			{
				FileCreateDir, %path%
			}
			UpdateList()
		}
		else
		{
			FileCreateDir, %WorkDir%
			path := WorkDir . "\Gross"
			FileCreateDir, %path%
			path := WorkDir . "\Fulfilment"
			FileCreateDir, %path%
			path := WorkDir . "\Månterm2"
			FileCreateDir, %path%
		}
	}
	Gui, Notes:Show

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
		
			;Window Close MAIN
			NotesGuiClose:
			NotesGuiEscape:
			{	
				ExitApp
				return
			}
			
			;Main AddButton
			NotesAdd:
			{	
				Gui, Submit
				FormatTime, date, , yy-MM-dd
				Filename = %workdir%\%date%.txt
				FileText := "----------`n" . Note  . "`n`n"
				FileAppend, %FileText%, %Filename%
				
				Gui, Notes:Show

				return
			}
			NotesGetInfo:
				m_clipboard := clipboard
				clipboard := ""
				id := Get_Id("Partner")
				WinActivate, ahk_id %id%
				Sleep, 100
				Send ^a
				Sleep 100
				Send ^c
				Sleep 100
				GuiControl, , Note, %clipboard%

				Gui, Notes:Show
				clipboard := m_clipboard				
			return
			
			;Main AddGrossButton
			NotesAddGross:
			{	
				Gui, Notes:Hide
				
				Gui, NotesAddGross:Show
				
				return
			}
		
			;Main AddFulButton
			NotesAddFul:
			{
				Gui, Notes:Hide
				
				Gui, NotesAddFul:Show
				
				return
			}
			
			;Main AddMåntermButton
			NotesAddMånterm:
			{	
				Gui, Notes:Hide

				Gui, NotesAddMånterm:Show
				
				return
			}

			;Main RemoveButton
			NotesRemove:
			{
				Gui, Submit
				
				path = %WorkDir%\%NoteList%.txt
				
				FileDelete, %path%
				UpdateList()
				
				Gui, Notes:Show
				return
			}
			
			;Main UpdateButton
			NotesUpdate:
			{
				Gui, Submit
				
				path = %WorkDir%\%NoteList%.txt
				
				FileDelete, %path%
				FileAppend, %Note%, %path%
				
				Gui, Notes:Show
				return
			}
			
			;Main NodeListUpdate Updates text with choise
			NoteListUpdate:
			{
				Gui, Submit
				if StrLen(NoteList) <> 0
				{
					path = %WorkDir%\%NoteList%.txt
					FileRead, file, %path%
					
					GuiControl,, Note, %file%
				}
				Gui, Notes:Show
				return
			}
		
		}
		
		;Sub Windows
		{
		
			;Window Close NOT MAIN
			NotesAddGrossGuiClose:
			NotesAddGrossGuiEscape:
			NotesAddFulGuiClose:
			NotesAddFulGuiEscape:
			NotesAddMåntermGuiClose:
			NotesAddMåntermGuiEscape:
			NotesAddGuiClose:
			NotesAddGuiEscape:
			{	
				Gui, NotesAdd:Hide
				Gui, NotesAddGross:Hide
				Gui, NotesAddFul:Hide
				Gui, NotesAddMånterm:Hide
				Gui, Notes:Show
				return
			}
			
			;NotesAdd Window
			{
				
				;NotesAdd Savebutton
				NotesAddSave:
				{
					Gui, Submit
					
					path = %WorkDir%\%NotesAddName%.txt
					
					IfExist, %path%
						FileDelete, %path%
					
					FileAppend, %NotesAddText%, %path%
					
					UpdateList()
					
					Gui, Notes:Show
					
					return
				}
			}
			
			;NotesAddGross Window
			{
				;NotesAddGross Savebutton
				NotesAddGrossSave:
				{	
					Gui, Submit
					
					path = %WorkDir%\Gross\%NotesAddGrossName%.txt
					
					IfExist, %path%
						FileDelete, %path%
					
					GrossText := ""

					GrossText .= NotesAddGrossAbgType . ": " . NotesAddGrossAbgValue . "`n" 
					GrossText .= "Namn: " . NotesAddGrossName . "`n"
					GrossText .= "Orgnummer: " . NotesAddGrossOrgnummer . "`n"
					GrossText .= "Kontaktnummer: " . NotesAddGrossKnummer . "`n"
					GrossText .= "Kontaktperson: " . NotesAddGrossKnamn . "`n"
					if (NotesAddGrossAbgType <> "OSUB")
						GrossText .= "Telefon:" . NotesAddGrossPhone . NotesAddGrossColor "`n"
					GrossText .= "Notering: " . NotesAddGrossText . "`n"

					FileAppend, %GrossText%, %path%
					
					UpdateList()
					
					Gui, Notes:Show
					
					return
				}
				
				;NotesAddGross AbgType
				NotesAddGrossAbgType:
				{
					Gui, Submit
					
					if InStr(NotesAddGrossAbgType, "BAS")
					{
						GuiControl, NotesAddGross:, NotesAddGrossAbgValue, |Rörligt|0.5 GB||2 GB|5 GB
					}
					else
					{
						GuiControl, NotesAddGross:, NotesAddGrossAbgValue, |1 GB|5 GB||30 GB|100 GB|200 GB
					}
					
					if InStr(NotesAddGrossAbgType, "OSUB")
					{
						GuiControl, Disable, NotesAddGrossPhone
						GuiControl, Disable, NotesAddGrossColor
					}
					else
					{
						GuiControl, Enable, NotesAddGrossPhone
						GuiControl, Enable, NotesAddGrossColor
					}
					
					Gui, NotesAddGross:Show
				
					return
				}
				
				;NotesAddGross PhoneUpdate
				NotesAddGrossPhoneUpdate:
				{
					Gui, Submit
					path := LoadDir . "\" . NotesAddGrossPhone . ".txt"
					temp_list := ""
					
					Loop, read, %path%
					{
						temp_list .= "|" . A_LoopReadLine
					}
					
					GuiControl, NotesAddGross:, NotesAddGrossColor, %temp_list%
					
					Gui, NotesAddGross:Show
					
					return
				}
				
			}
			
			;NotesAddFul Window
			{
				;NotesAddFul Savebutton
				NotesAddFulSave:
				{
					Gui, Submit
					
					path = %WorkDir%\Fulfilment\%NotesAddFulName%.txt
					
					IfExist, %path%
						FileDelete, %path%
					
					FulText := ""
					FulText .= NotesAddFulAbgType . ": " . NotesAddFulAbgValue . "`n" 
					FulText .= "Namn: " . NotesAddFulName . "`n"
					FulText .= "Orgnummer: " . NotesAddFulOrgnummer . "`n"
					FulText .= "Nummer: " . NotesAddFulNummer . "`n"
					FulText .= "Kontaktnummer: " . NotesAddFulKnummer . "`n"
					FulText .= "Kontaktperson: " . NotesAddFulKnamn . "`n"
					FulText .= "Telefon:" . NotesAddFulPhone . NotesAddFulColor "`n"
					FulText .= "Notering: " . NotesAddFulText . "`n"
					
					FileAppend, %FulText%, %path%
					
					UpdateList()
					
					Gui, Notes:Show
					
					return
				}
				
				;NotesAddFul AbgType
				NotesAddFulAbgType:
				{
					Gui, Submit
					
					if InStr(NotesAddFulAbgType, "BAS")
					{
						GuiControl, NotesAddFul:, NotesAddFulAbgValue, |Rörligt|0.5 GB||2 GB|5 GB
					}
					else
					{
						GuiControl, NotesAddFul:, NotesAddFulAbgValue, |1 GB|5 GB||30 GB|100 GB|200 GB
					}
					
					if InStr(NotesAddFulAbgType, "OSUB")
					{
						GuiControl, Disable, NotesAddFulPhone
						GuiControl, Disable, NotesAddFulColor
					}
					else
					{
						GuiControl, Enable, NotesAddFulPhone
						GuiControl, Enable, NotesAddFulColor
					}
					
					Gui, NotesAddFul:Show
				
					return
				}
				
				;NotesAddFul PhoneUpdate
				NotesAddFulPhoneUpdate:
				{
					Gui, Submit
					path := LoadDir . "\" . NotesAddFulPhone . ".txt"
					temp_list := ""
					
					Loop, read, %path%
					{
						temp_list .= "|" . A_LoopReadLine
					}
					
					GuiControl, NotesAddFul:, NotesAddFulColor, %temp_list%
					
					Gui, NotesAddFul:Show
					
					return
				}
				
			}
			
			;NotesAddMånterm Window
			{
				;NotesAddMånterm Savebutton
				NotesAddMåntermSave:
				{	
					Gui, Submit
					
					path = %WorkDir%\Månterm2\%NotesAddMåntermName%.txt
					
					IfExist, %path%
						FileDelete, %path%
					
					
					
					MåntermText := ""
					MåntermText .= "Namn: " . NotesAddMåntermName . "`n"
					MåntermText .= "Orgnummer: " . NotesAddMåntermOrgnummer . "`n"
					MåntermText .= "Nummer: " . NodesAddMåntermNummer . "`n"
					MåntermText .= "Kontaktnummer: " . NotesAddMåntermKnummer . "`n"
					MåntermText .= "Kontaktperson: " . NotesAddMåntermKnamn . "`n"
					MåntermText .= "Telefon:" . NotesAddMåntermPhone . NotesAddMåntermColor "`n"
					MåntermText .= "Notering: " . NotesAddMåntermText . "`n"
					
					FileAppend, %NotesAddMåntermText%, %path%
					
					UpdateList()
					
					Gui, Notes:Show
					
					return
				}
				
				;NotesAddMånterm PhoneUpdate
				NotesAddMåntermPhoneUpdate:
				{
					Gui, Submit
					path := LoadDir . "\" . NotesAddMåntermPhone . ".txt"
					temp_list := ""
					
					Loop, read, %path%
					{
						temp_list .= "|" . A_LoopReadLine
					}
					
					GuiControl, NotesAddMånterm:, NotesAddMåntermColor, %temp_list%
					
					Gui, NotesAddMånterm:Show
					
					return
				}
				
			}
		
		}
	
	}
	
	;UpdateList Updates NodeList with existings files
	UpdateList()
	{
		GuiControl, -Redraw, NoteList
		GuiControl,Notes:, NoteList ,|
		global WorkDir
		Loop, %WorkDir%\*.txt
		{
			test := A_LoopFileName
			StringTrimRight, test, test, 4
			GuiControl,Notes:,NoteList, %test%
		}
		Loop, %WorkDir%\Gross\*.txt
		{
			test := A_LoopFileName
			StringTrimRight, test, test, 4
			GuiControl,Notes:,NoteList, Gross\%test%
		}
		Loop, %WorkDir%\Fulfilment\*.txt
		{
			test := A_LoopFileName
			StringTrimRight, test, test, 4
			GuiControl,Notes:,NoteList, Fulfilment\%test%
		}
		Loop, %WorkDir%\Månterm2\*.txt
		{
			test := A_LoopFileName
			StringTrimRight, test, test, 4
			GuiControl,Notes:,NoteList, Månterm2\%test%
		}
		
		GuiControl, +Redraw, NoteList
		GuiControl, Choose, NodeList, |1
		return
	}
}


Get_Id(stringname)
{
	WinGet, ID_LIST, List
	Loop, %ID_LIST%
	{
		this_id := ID_LIST%A_Index%
		WinGetTitle, this_title, ahk_id %this_id%
		if (InStr(this_title, stringname))
			return this_id
	}
	return 0
}