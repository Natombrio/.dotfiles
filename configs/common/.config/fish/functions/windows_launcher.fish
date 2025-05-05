function windows_launcher --description "Launch target with cmd.exe"
    set launch_command '/mnt/c/Windows/System32/cmd.exe' /C $argv
    command $launch_command
end
