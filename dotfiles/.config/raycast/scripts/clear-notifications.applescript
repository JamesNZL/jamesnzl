#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clear Notifications
# @raycast.mode silent

# Optional parameters:
# @raycast.icon	🔇 

# Documentation:
# @raycast.description Clears all notifications from Notification Centre
# @raycast.author JamesNZL
# @raycast.authorURL https://raycast.com/jamesnzl

tell application "System Events" to tell process "NotificationCenter"
	repeat with notificationWindow in windows
		tell notificationWindow
			set entireContents to entire contents
			repeat with content in reverse of entireContents -- iterate backwards so we close bottom notifications first, if that matters
				if class of content is group then
					# set groupStaticTexts to static texts of content
					# repeat with staticText in groupStaticTexts
						# set foundText to false
						# if value of staticText is equal to "Disk Not Ejected Properly" then
							# set foundText to true
							# exit repeat
						# end if -- text is the text we want to find
					# end repeat -- staticTexts in group
					# 
					# if foundText then
						-- We'd like to look for buttons in the group called "Close", but recent macOS versions hide the Close button until you hover over the notification, and there's apparently no way to hover in AppleScript. Instead, we inspect the actions of the group, and look for the one called "Close".
						-- actions trick via https://github.com/Ptujec/LaunchBar/blob/master/Notifications/Dismiss%20all%20notifications.lbaction/Contents/Scripts/default.applescript via https://www.reddit.com/r/applescript/comments/ycilyr/comment/iu5m3q5/?context=3
						
						repeat with groupAction in actions of content
							if description of groupAction is equal to "Close" then
								perform groupAction
								exit repeat
							end if
						end repeat
					# end if

					delay 0.2
				end if -- if class of content is group
			end repeat -- entire contents of window
		end tell -- notificationWindow
	end repeat
end tell