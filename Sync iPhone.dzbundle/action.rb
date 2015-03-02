# Dropzone Action Info
# Name: Sync iPhone
# Description: Sync iPhone with iTunes when the iPhone is connected.
# Creator: Zhiming Wang
# URL: https://github.com/zmwangx
# Events: Clicked
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: No
# Version: 1.0
# MinDropzoneVersion: 3.0

def clicked
  `osascript -e '
tell application "iTunes"
  set src to (some source whose name contains "iPhone")
  tell src to update
end tell'`
  $dz.url(false)
end
