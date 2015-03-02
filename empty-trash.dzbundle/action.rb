# Dropzone Action Info
# Name: empty-trash
# Description: Empty Trash.
# Creator: Zhiming Wang
# URL: http://github.com/zmwangx
# Events: Clicked
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: No
# Version: 1.0
# MinDropzoneVersion: 3.0

def clicked
  `rm -rf ~/.Trash`
  $dz.url(false)
end
