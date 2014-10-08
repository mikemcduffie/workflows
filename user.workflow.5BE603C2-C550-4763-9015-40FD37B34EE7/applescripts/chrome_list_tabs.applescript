on run argv
    set theOutput to ""
    set windowIndex to 1

    tell application "Google Chrome"
        repeat with theWindow in windows
            try
                set tabIndex to 1
                repeat with theTab in tabs of theWindow
                    set theOutput to theOutput & windowIndex as string & ":" & tabIndex as string & "\n" & url of theTab & "\n" & title of theTab & "\n"
                    set tabIndex to tabIndex + 1
                end repeat
            end try
            set windowIndex to windowIndex + 1
        end repeat
    end tell

    theOutput
end run