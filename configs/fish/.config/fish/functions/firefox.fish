#!/usr/sbin/fish

function firefox --description "Launch windows firefox.exe"
    set launch_command 'C://Program Files/Mozilla Firefox/firefox.exe' $argv
    windows_launch $launch_command
end
