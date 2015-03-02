# Dropzone Action Info
# Name: im-ul
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
  ENV['PATH'] = '/usr/local/bin:/bin:/usr/bin'
  IO.popen([ "#{Dir.home}/src/imgur-py/im-ul" ] + $items) {|io| $dz.text(io.read)}
end
