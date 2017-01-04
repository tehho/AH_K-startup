Suspend, off

m_tab_delay = 300

Get_ID_List()
{
	WinGet, Title, List
	ret := []
	Loop, %Title%
	{
		temp_id := Title%A_Index%
		WinGetTitle, temp_title ,ahk_id %temp_id%
		ret.Push(temp_title)
	}
	Return ret
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
