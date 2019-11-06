#include <Constants.au3>

; AutoIt Version: 3.0
; Language:       English
; Platform:       Win10
; Author:         Levi Sylvester
;
; Script Function: Opens a text document in notepad, copies some numbers in Google Sheets, sums them and then quits the applications.

; Prompt the user to run the script - use a Yes/No prompt with the flag parameter set at 4 (see the help file for more details)
Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "AutoIT: Notepad & Google Sheets", "This script will open a text document in Notepad containing some numbers, copy them to Google Sheets, sum them up and then quit the applications.  Do you want to run it? :D")

; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox($MB_SYSTEMMODAL, "AutoIT: :(", "Ok, I don't show it to you! :P Goodbye!")
	Exit
EndIf

; Open Notepad and wait till the window becomes active

; Run ("C:\Users\szilv\Documents\Computer\LearnProgramming\AutoIT\TemaAutoIT.txt") this didn't work

Run ("notepad.exe")
WinWaitActive ("[CLASS:Notepad]")
; Press Ctrl+F to open the file menu
Sleep (2000)
Send ("!f")
; Wait one second to let the viewer see what happens
Sleep (1000)
; Prees Down Arrow key then Enter to start the Open file window, then open the text document containing the numbers and copy them to clipboard
Send ("{DOWN}")
Sleep (1000)
Send ("{Enter}")
WinWaitActive ("[CLASS:#32770]")
Sleep (1000)
Send ("C:\Users\szilv\Documents\Computer\LearnCoding\AutoIT\TemaAutoIT.txt")
Sleep (1000)
Send ("{Enter}")
WinWaitActive ("[CLASS:Notepad]")
Sleep (1000)
Send ("^a")
Sleep (1000)
Send ("^c")
Sleep (1000)

; Open Google Chrome, wait till it becomes active, go to google drive and open a specific Google Sheets document, paste the numbers & sum them up
Run ("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
WinWaitActive ("[CLASS:Chrome_WidgetWin_1]")
Sleep (2000)
Send ("https://drive.google.com/drive/my-drive")
Sleep (1000)
Send ("{Enter}")
WinWaitActive ("[CLASS:Chrome_WidgetWin_1]")
Sleep (6000)
Send ("/")
Sleep (1000)
Send ("TemaAutoIT")
Sleep (1000)
Send ("{Enter}")
Sleep (8000)
Send ("{Down}")
Sleep (1000)
Send ("{Enter}")
WinWaitActive ("[CLASS:Chrome_WidgetWin_1]")
Sleep (12000)
Send ("^v")
Sleep (8000)

; Send ("{DOWN 10}") didn't work so I wrote them one by one

Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (100)
Send ("{DOWN}")
Sleep (3000)
Send ("=Sum(A1:A10)")
Sleep (3000)
Send ("{Enter}")
Sleep (2000)

; Now it closes the two open windows and exits the script
Send ("!{F4}")
Sleep (1000)
WinWaitActive ("[CLASS:Notepad]")
Sleep (1000)
Send ("!{F4}")
Exit
