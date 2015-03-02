# Dropzone Action Info
# Name: 7sha1
# Description: Attach "__" and the first seven digits of the SHA-1 digest of a file to its filename (intended to resolve naming conflicts and facilitate sharing over the Internet).
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

def rename(items)
    num_items = items.length

    # if no items, do nothing
    if num_items == 0
        $dz.url(false)
        return
    end

    # process each item
    $dz.determinate(true)
    num_done = 0
    items.each {|path|
        percentage = (100.0 / num_items * num_done).round
        $dz.begin(File.basename(path))
        $dz.percent(percentage)

        if ! File.directory?(path)
            extname = File.extname(path)
            basename = File.basename(path, extname)
            dirname = File.dirname(path)
            new_basename = basename + "__" + Digest::SHA1.file(path).hexdigest[0,7]
            new_path = File.join(dirname, new_basename + extname)
            FileUtils.mv(path, new_path)
        end

        num_done += 1
    }

    $dz.finish("Jobs complete")
    $dz.url(false)
end

def dragged
    rename($items)
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

    items = items_string.split("\n")
    rename(items)
end
