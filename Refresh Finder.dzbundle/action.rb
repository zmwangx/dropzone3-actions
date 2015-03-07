# Dropzone Action Info
# Name: Refresh Finder
# Description: Refresh the frontmost window of Finder using AppleScript. Useful when you work with Transmissions — for some reason, directories created by Transmissions never refresh until changes are made explicitly in Finder.
# Creator: Zhiming Wang
# URL: https://github.com/zmwangx
# Events: Clicked
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: No
# Version: 1.0
# MinDropzoneVersion: 3.0

def clicked
  `osascript -e 'tell application "Finder" to tell front window to update every item'`
  $dz.url(false)
end
