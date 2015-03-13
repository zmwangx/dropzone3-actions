# Dropzone Action Info
# Name: torrent2magnet
# Description: Convert torrent files to magnet URIs using the node package magnet-link.
# Handles: Files
# Creator: Zhiming Wang
# URL: http://github.com/zmwangx
# Events: Dragged
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: No
# Version: 1.0
# MinDropzoneVersion: 3.0

def dragged
  ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']
  magnet_links = ""
  $items.each {|path|
    next if not File.file?(path) or not File.fnmatch?('*.torrent', path)
    magnet_links += `/usr/local/bin/magnet-link #{Shellwords.escape(path)}`
  }
  $dz.text(magnet_links)
end
