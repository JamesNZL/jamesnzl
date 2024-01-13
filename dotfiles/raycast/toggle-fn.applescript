#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Fn Lock
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⌨️
# @raycast.packageName System

# Documentation:
# @raycast.description Toggle system fn lock
# @raycast.author JamesNZL
# @raycast.authorURL https://github.com/jamesnzl

-- Apple Script (i.e. Use in Apple's Script Editor Application) to Toggle Function Keys / Media keys on/off
-- Tested on MacOS Sonoma (14.2.1) Sep 2023, MacOS Monterey (12.6.2) July 2023, MacOS Ventura (13.4.1) July 2023
-- Project Path: https://github.com/MrSimonC/Toggle-Mac-Function-Keys

set osver to system version of (system info)

open location "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"

tell application "System Events" to tell process "System Settings"
    # example window title: "Keyboard – ￼86%", so "begins with" is needed
    repeat until window begins with "Keyboard" exists
    end repeat
    
    # wait until Keyboard window is the main window of the application and is accessible
    repeat until exists of (1st window whose value of attribute "AXMain" is true)
    end repeat
    
    # "Keyboard Shortcuts..." Button
    set keyboardButton to 1
    # in MacOS 14 Sonoma, button 1 & 2 are assigned to keyboard brightness
    if osver ≥ 14.0 and osver < 14.2 then
        set keyboardButton to 3
    end if
    click button keyboardButton of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
    
    repeat until sheet 1 of window 1 exists
    end repeat
    
    # Click Function Keys
    keystroke "f"
    
    repeat until checkbox "Use F1, F2, etc. keys as standard function keys" of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1 exists
    end repeat
    
    click checkbox "Use F1, F2, etc. keys as standard function keys" of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
    
    # "Done" Button - Close the sheet so the application can quit
    click button 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
    
    # Attempting to check the sheet at a certain point while closing will throw an error
    # In that case, the outer repeat will try again
    repeat
        try
            repeat while sheet 1 of window 1 exists
            end repeat
            exit repeat
        end try
    end repeat
end tell

tell application "System Settings" to quit
