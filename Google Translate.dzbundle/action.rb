# Dropzone Action Info
# Name: Google Translate
# Description: Translate dropped text.
# Handles: Files, Text
# Creator: Zhiming Wang
# URL: https://github.com/zmwangx
# Events: Clicked, Dragged
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: Yes
# Version: 1.0
# MinDropzoneVersion: 3.0
# RubyPath: /usr/local/bin/ruby

def set_env
    ENV['LANG'] = 'en_US.UTF-8'
    ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']
end

def dragged
    set_env
    case ENV['dragged_type']
        when 'text'
        original = $items[0]

        when 'files'
        original = ""
        $items.each {|path| original += File.basename(path).encode("UTF-8", "UTF8-MAC") + "\n"}
    end
    translation = `trans -b "#{original}"`
    $dz.alert("Google Translate", "original:\n#{original}\n\ntranslation:\n#{translation}")
end

def clicked
    set_env
    original = `pbpaste`
    translation = `trans -b "#{original}"`
    $dz.alert("Google Translate", "original:\n#{original}\n\ntranslation:\n#{translation}")
end
