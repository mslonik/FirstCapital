# Quick info

Application name: **First Capital Hotstrings**.

Operating system: Microsoft Windows Ⓡ.

Programming language: AutoHotkey (scripting language for RPA), version 1.1.x.

License: GNU GPL v3.x (GNU's Not Unix! General Public License).

Purpose: automatic capitalization the first letter in sentence.

Author: Maciej Słojewski (🐘), http://mslonik.pl.

## Purpose, detailed

Many editors still do not have automatic capitalization the first letter in a sentence (any out of 26 letters of latin alphabet). This script works in any window, where text is involved. It recognizes the following text paterns and automatically replaces them accordingly:

| example user text pattern | automatic text replacement | notes |
| :---:         |     :---:      |          :--- |
| foo. bar   | foo. Bar     | In any sequence containing **dot** <.> followed by space and ordinary letter that letter will be converted into capital letter.    |
| foo! bar     | foo! Bar       | In any  sequence containing **exclamation mark** <!> followed by space and ordinary that letter will be converted into capital letter.      |
| foo? bar     | foo? Bar       | In any  sequence containing **question mark** <?> followed by space and ordinary letter that letter will be converted into capital letter.      |
| foo\<enter> bar     | foo\<enter> Bar       | In any sequence containing **new line sequence** \<enter> followed by space and ordinary letter that letter  will be converted into capital letter.      |

In ohter words application uses so called hotstrings to mimic automatic capitalization of the first sentence character.

Please mind this application is not able to completely replace the same functionality offered by other applications natively. For example the very first sentence / character entered in a new window will not be replaced as there is no previous punctuation character to be recognized as fitting to replacement pattern.

**Hint**. Some simple editors, e.g. in text messengers like Signal, the empty first lines are not shown. So you can press <enter> which will not be shown as empty line in messenger window, but can start text replacement sequence of **First Capital Hotstrings**.

## Control
It is possible to disable and later disable application on time it is running. It can be useful if particular application has the same functionality running and user would like to disable it. The known applications with the same functionality: Microsoft Word, Microsoft Outlook. Next, text replacements can be enabled again on the fly.

When disabled, above text patterns are not converted automatically anymore. 

User may control the script / application over the following means:

### System tray icon
When application runs its state can be checked by left button click by mouse on System tray "<" icon (usually located at bottom right corner of a screen or taskbar) ![system tray icon](pictures\SysTray.png) and then by right button click by mouse on **FirstCapitalHotstrings** icon: ![FirstCapitalHotstrings application icon](pictures\FirstCapitalHotstringIcon.png). 

Alternatively using keyboard only: to select system tray use shortcut "# + B" (Windows modifier key down and then press B, release both keys); navigate by pressing cursor keys (→, ←, ↑, ↓) to FirstCapitalHotstrings application icon and then press context menu key (hamburger menu) or press "Shift + F10" (Shift modifier key down and then press F10 funciton key, release both keys).

You will gain access to the following menu: <br />
![FirstCapitalHotstrings application context menu](pictures\ContextMenu.png).

The first context menu line in **bold** shows actual status of application.
The second one may be used to toggle status of appliction (ENABLED → DISABLED or other way around).
The third one shows message box about different ways to control status of application.
The last one shows message box about purpose and some basic application info.

### Command line
In CLI (Command Line Interface) you can enter only one parameter:
| parameter | meaning | 
| :---:         |     :---      |
| -d   | starts application in disabled state     |
| -e     | starts application in enabled state (default)      |

### Hotstrings
| hotstring | action | 
| :---         |     :---      |
| fchelp/   | shows the following  message box  |
| fcshow/     | displays message box with current application state: ENABLED or DISABLED |

		. "fcstatus/" . A_Tab . A_Tab .	"current state: ENABLED or DISABLED"		. "`n"
		. "fctoggle/" . A_Tab . A_Tab . 	"toggle between ENABLED and DISABLED"		. "`n"
		. "fcenable/" . A_Tab . A_Tab . 	"enable first capital"					. "`n"
		. "fcdisable/" . A_Tab . 		"disable first capital"					. "`n"
		. "fcrestart/" . A_Tab . A_Tab .	"reload" . A_Space . "application"			. "`n"
		. "fcreload/" . A_Tab . A_Tab . 	"reload" . A_Space . "application"			. "`n"
		. "fcexit/" . A_Tab . A_Tab .		"exit" . A_Space . "application"


# Acknowledgments

Jack Dunning for inspiration.