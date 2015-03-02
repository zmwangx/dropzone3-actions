# Dropzone Action Info
# Name: basenames
# Description: Get basenames of dropped or selected items.
# Handles: Files
# Creator: Zhiming Wang
# URL: https://github.com/zmwangx
# Events: Clicked, Dragged
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: No
# Version: 1.0
# MinDropzoneVersion: 3.0

require "digest"
require "fileutils"

def basenames(items)
    num_items = items.length

    # if no items, do nothing
    if num_items == 0
        $dz.url(false)
        return
    end

    # process each item
    basenames_string=""
    items.each {|path| basenames_string += File.basename(path) + "\n" }

    $dz.finish("Jobs complete")
    $dz.text(basenames_string)
end

def dragged
    basenames($items)
end

def clicked
    items_string = `osascript <<END
set pathList to ""
tell application "Finder"
	set theSelection to the selection
        if theSelection = {} then return
	repeat with theItem in theSelection
		set pathList to pathList & POSIX path of (theItem as text) & linefeed
	end repeat
end tell
return text 1 through -2 of pathList
END`

    basenames(items_string.split("\n"))
end
