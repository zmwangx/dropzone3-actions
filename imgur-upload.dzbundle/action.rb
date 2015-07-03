# Dropzone Action Info
# Name: imgur-upload
# Description: Upload image(s) to imgur.
# Handles: Files
# Creator: Zhiming Wang
# URL: https://github.com/zmwangx
# Events: Dragged
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: No
# Version: 1.0
# MinDropzoneVersion: 3.0

def dragged
  ENV['PATH'] = "#{Dir.home}/.pyenv/shims:/usr/local/bin:/bin:/usr/bin"
  IO.popen([ "imgur-upload" ] + $items) {|io| $dz.text(io.read)}
end
