; Author: Szilveszter Levente, email: l3vi.sylvester@gmail.com, tel. 0752243611 (temp)

; The Final Project consists of 2 automations () & {} joined together as follows
; (AutoIT: Trello - Testrail[ - Mantis] - {SeleniumC#): - Tests - eMail} 5 minutes total
; With this automation I would like to simulate a real life scenario on the job
; See system requirements in C0TestCaseFinalProject.txt
; Variables used are mostly of strings and
; in the following disabled (commented) If-Else section of the code I used one more variable for storing a colour which is then converted into Hex
; In SeleniumC# I mostly used string variables again for storing and retrieving webelements for easy access
; In AutoIT I tried using Tabs instead of Clicks everywhere possible and used the methods that you can see bellow
; In SeleniumC# I used Assert method for testing the correct state of certain elements
; " used Xpath for identifying where by id/class/name etc. where not possible
; See bellow in comments the clear steps that it takes or more detailed inside C0TestCaseFinalProject.txt
; Our program consists of about 250 lines of code total
; It starts here and no further actions are required, SeleniumC# takes the lead automatically later on

; Enjoy the short jurney of our tester robot! :)

$user = "testertesting557@gmail.com"
$password = "testers1@"
Run ("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito", "", @SW_MAXIMIZE)
;~ Run ("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", "", @SW_MAXIMIZE)
WinWaitActive ("[CLASS:Chrome_WidgetWin_1]")
Send ("trello.com")
Sleep (1000)
Send ("{Enter}")
Sleep (8000); the following commented code is relevant in normal mode (not incognito)
            ; it logs in if logged out or logs out and back in with current variables

;~ $Colour = PixelGetColor (1165, 98)
;~ MsgBox (0, "", $Colour)
;~ $Colour = Hex ($Colour)
;~ MsgBox (0, "", $Colour)
;~ If ($Colour = "00026AA7") Then
;~     Send ("{TAB 4}")
;~     Sleep (1000)
;~     Send ("{ENTER}")
;~     Sleep (5000)
;~ Else
Send ("{TAB 2}")
Sleep (1000)
Send ("{ENTER}")
Sleep (4000)
    Send ("^a"); it logs in to Trello.com, let's say it simulates Jira in a way
    Send ($user)
    Sleep (2000)
    Send ("{TAB}")
    Send ("^a")
    Send ($password)
    Sleep (1000)
    Send ("{ENTER}")
    Sleep (8000)
    Send ("{TAB 4}"); enters Testing board
    Sleep (1000)
    Send ("{ENTER}")
    Sleep (3000)
;~ EndIf

MouseClick ("", 1316, 439)
Sleep (1000)
Send ("{TAB 8}"); it navigates to the task that has to be done on the job
Sleep (1000)
Send ("{ENTER}"); opens Ecosia Regression Tests card
Sleep (8000)
MouseClick ("", 676, 198); it shows how Ecosia looks like
Sleep (8000)
Send ("{Esc}")
Sleep (2000)
Send ("{TAB 4}"); navigates to Testrail link
Sleep (1000)
Send ("{ENTER}"); tries to open the test suite
Sleep (8000)

Send ("^a"); it has to log in to testrail
    Send ($user)
    Sleep (1000)
    Send ("{TAB}")
    Send ("^a")
    Send ($password)
    Sleep (1000)
    Send ("{ENTER}")
    Sleep (8000)

MouseClick ("", 251, 591); opens past bug report for Ecosia on Firefox that was fixed, therefore the regression tests (that contains a retest also)
Sleep (10000)
Send ("{BROWSER_BACK}")
Sleep (3000)
MouseClick ("", 175, 402); opens test case for Firefox as an exemple
Sleep (10000)
MouseClick ("", 245, 626); shows the expected result (one for all three test cases: Chrome, Edge, Firefox as well)
Sleep (5000)
Send ("{Esc}")
Sleep (2000)
Send ("{BROWSER_BACK}")
Sleep (3000)
MouseClick ("", 125, 302, 3); copies the automation link for Browsers Test Suite to clipboard
Sleep (1000)
Send ("^c")
Sleep (1000)

Send ("{LWIN}"); with the pasted link it opens the project in Visual Studio
Sleep (1000)
Send ("^v")
Sleep (1000)
Send ("{ENTER}")
Sleep (30000); waits 30 seconds, that's what it takes to open Visual Studio on my laptop and NUnit tests to appear
MouseClick ("", 128, 396)
Sleep (1000)

Send ("^{RIGHT}"); it expands the NUnit tests and runs them all
Sleep (1000)
Send ("^a")
;~ Send ("{ENTER}")
Sleep (1000)
MouseClick ("right", 186, 243, 2)
Sleep (2000)
Send ("{DOWN}")
Sleep (1000)
Send ("{ENTER}")
Exit
; end of code in AutoIt
; SeleniumC# took the lead from here for the three regression tests which contains a retest as well in Firefox
; then inside test case for Firefox if everything ran smoothly it sends an email through gmail to the coder :)
