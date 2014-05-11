(*
	A basic script for managing due dates.
	
	A slightly adapted version of the original, found at
	http://www.hogbaysoftware.com/wiki/DueDates
*)

property dueTag : "due"
property repeatTag : "repeat"
property todayTag : "today"
property overdueTag : "overdue"
property upcomingTag : "upcoming"
property doneTag : "done"
property inProgressTag : "inprogress"
property errorTag : "error"
property removeTags : {upcomingTag, todayTag, overdueTag, inProgressTag}
property upcomingDays : 5

property numberSet : {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

global vToday
set vToday to current date
set time of vToday to 0

tell front document of application "TaskPaper"
	--convert every relative text date to a due tag
	repeat with each in entries
		tell each
			if not (exists tag named "done") and not (exists tag named "due") then
				if (exists tag named "today") then
					set (name of tag named "today") to "due(today)"
				else if (exists tag named "tomorrow") then
					set (name of tag named "tomorrow") to "due(tomorrow)"
				end if
			end if
		end tell
	end repeat
	--Start by converting any due tags with a text description of the date
	--to an actual date
	repeat with tpDueTag in (every tag of (every entry) whose name is dueTag)
		tell tpDueTag
			set vDueVal to value
			if vDueVal is missing value then
				set vDueVal to "today"
			end if
			if character 1 of vDueVal is not in numberSet then
				set vDateString to null
				tell me to set vDate to getDateForDueValue(vDueVal)
				if vDate is not null then
					tell me to set vDateString to getTextFromDate(vDate)
				else
					tell entry of tpDueTag
						make new tag with properties {name:errorTag, value:"Unknown value for due tag"}
					end tell
				end if
				if vDateString is not null then
					set value to vDateString
				end if
			end if
		end tell
	end repeat
	
	--Next handle repeat tags. A due tag is not required on these.
	repeat with tpRptTag in (every tag of (every entry) whose name is repeatTag)
		tell entry of tpRptTag
			set tagList to (every tag whose name is dueTag)
			set needDue to false
			if tagList is {} then
				--no due tag, create one, and remember to fill in a date below.
				--use today as the start date
				set tpDueTag to make new tag with properties {name:dueTag}
				copy vToday to vDate
				set needDue to true
			else
				--have a due tag, use that as the start date
				set tpDueTag to first item of tagList
				set dateString to (get value of tpDueTag)
				tell me to set vDate to getDateFromText(dateString)
			end if
			if not needDue then
				set tagList to (every tag whose name is doneTag)
			end if
			--if there was no due tag, or the entry is marked done,
			--the calculate and set the date of the due tag.
			if needDue or tagList is not {} then
				--Delete all extra tags
				repeat with delTag in removeTags
					delete (every tag whose name is delTag)
				end repeat
				
				--Create a date from the repeat value
				set rInfo to (get value of tpRptTag)
				if (vDate is not null) then
					tell me to set vDate to getRepeatDate(rInfo, vDate)
				end if
				
				if vDate is not null then
					--fill in the date, make sure it is not marked done
					tell me to set vDateText to getTextFromDate(vDate)
					set value of tpDueTag to vDateText
					delete (every tag whose name is doneTag)
				else
					--flag unknown repeat value with an error tag
					make new tag with properties {name:errorTag, value:"unknown repeat type"}
				end if
			end if
		end tell
	end repeat
	
	--Add/update the extra tags based on the due date of items that are not done
	repeat with tpDueTag in (every tag of (every entry) whose name is dueTag)
		tell entry of tpDueTag
			set tagList to (every tag whose name is doneTag)
			set errTagList to (every tag whose name is errorTag)
			if (tagList is {}) and (errTagList is {}) then
				--Not marked done, see if any tags need to be added
				set dateString to (get value of tpDueTag)
				tell me to set vDate to getDateFromText(dateString)
				if vDate is not null then
					set diffDays to (vDate - vToday) / days
					if (diffDays < 0) then
						set tagList to (every tag whose name is overdueTag)
						if (tagList is {}) then
							make new tag with properties {name:overdueTag}
						end if
						delete (every tag whose name is upcomingTag)
						delete (every tag whose name is todayTag)
					else if (diffDays = 0) then
						set tagList to (every tag whose name is todayTag)
						if (tagList is {}) then
							make new tag with properties {name:todayTag}
						end if
						delete (every tag whose name is upcomingTag)
					else if (diffDays ² upcomingDays) then
						set tagList to (every tag whose name is upcomingTag)
						if (tagList is {}) then
							make new tag with properties {name:upcomingTag}
							delete (every tag whose name is todayTag)
						end if
					end if
				else
					--invalid date format
					make new tag with properties {name:"error", value:"invalid date format"}
				end if
			else
				--Marked done, delete all extra tags
				repeat with delTag in removeTags
					delete (every tag whose name is delTag)
				end repeat
			end if
		end tell
	end repeat
end tell

on getDateFromText(dateText)
	set vDate to null
	set AppleScript's text item delimiters to {"-"}
	if (count of text item of dateText) is 3 then
		set vYear to text item 1 of dateText
		set vMonth to text item 2 of dateText
		set vDay to text item 3 of dateText
		if (vYear > 1000) and (vMonth > 0 and vMonth < 13) and (vDay > 0 and vDay < 32) then
			set vDate to current date
			set year of vDate to (vYear as integer)
			set month of vDate to vMonth as integer
			set day of vDate to vDay as integer
			set time of vDate to 0
		end if
	end if
	return vDate
end getDateFromText

on getTextFromDate(vDate)
	set dText to ((year of vDate) as text) & "-"
	set dayText to (month of vDate as number) as text
	if length of dayText is 1 then
		set dayText to "0" & dayText
	end if
	set dText to dText & dayText & "-"
	set dayText to (day of vDate as number) as text
	if length of dayText is 1 then
		set dayText to "0" & dayText
	end if
	return dText & dayText
end getTextFromDate

on getDateForDueValue(dueValue)
	set vDate to null
	if character 1 of dueValue is in numberSet then
		set vDate to getDateFromText(dueValue)
	else
		--Special cases for due date not handled in getRepeatDate
		if "today" is dueValue then
			copy vToday to vDate
		else if "tomorrow" starts with dueValue then
			copy vToday to vDate
			set vDate to vDate + 1 * days
		else
			set vDate to getRepeatDate(dueValue, vToday)
		end if
	end if
	return vDate
end getDateForDueValue

on getRepeatDate(repeatDesc, fromDate)
	copy fromDate to vDate
	
	set AppleScript's text item delimiters to {":"}
	set repeatType to text item 1 of repeatDesc
	if (count of text items in repeatDesc) > 1 then
		set repeatCount to text item 2 of repeatDesc
	else
		set repeatCount to 1
	end if
	
	if repeatType is "day" or repeatType is "week" then
		if repeatType is "day" then
			set vInterval to days
		else
			set vInterval to weeks
		end if
		set vDate to vDate + repeatCount * vInterval
		repeat while vDate comes before vToday
			set vDate to vDate + repeatCount * vInterval
		end repeat
	else if repeatType is "month" then
		set month of vDate to (month of vDate) + repeatCount
		repeat while vDate comes before vToday
			set month of vDate to (month of vDate) + repeatCount
		end repeat
	else if repeatType is "year" then
		set year of vDate to (year of vDate) + repeatCount
		log "vDate is " & vDate
		repeat while vDate comes before vToday
			set year of vDate to (year of vDate) + repeatCount
		end repeat
	else
		set rDay to 0
		if "sunday" starts with repeatType then
			set rDay to Sunday
		else if "monday" starts with repeatType then
			set rDay to Monday
		else if "tuesday" starts with repeatType then
			set rDay to Tuesday
		else if "wednesday" starts with repeatType then
			set rDay to Wednesday
		else if "thursday" starts with repeatType then
			set rDay to Thursday
		else if "friday" starts with repeatType then
			set rDay to Friday
		else if "saturday" starts with repeatType then
			set rDay to Saturday
		end if
		if rDay > 0 then
			--Handle case where vDate is not currect day of week.
			set vOffset to rDay - (weekday of vDate)
			if vOffset is not 0 then
				set vDate to vDate + vOffset * days
				if vOffset > 0 then
					--If we move forward, count that as 1
					set repeatCount to repeatCount - 1
				end if
			end if
			
			--Find next date after vDate
			set vOffset to 7 * repeatCount
			set vDate to vDate + vOffset * days
			repeat while vDate comes before vToday
				set vDate to vDate + vOffset * days
			end repeat
		else
			--Unknown type, return nothing
			set vDate to null
		end if
	end if
	
	return vDate
end getRepeatDate