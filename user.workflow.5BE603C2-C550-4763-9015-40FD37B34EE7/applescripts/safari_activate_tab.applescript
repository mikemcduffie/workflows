on run argv
    set windowIndex to (item 1 of argv as number)
    set tabIndex to (item 2 of argv as number)

    tell application "Safari"
        activate
        tell window windowIndex
            set current tab to tab tabIndex
            set index to 1
        end tell
    end tell

    -- Bring window to front
    tell application "System Events" to tell process "Safari"
        perform action "AXRaise" of window 1
        -- account for instances when the window doesn't switch fast enough
        delay 0.5
        perform action "AXRaise" of window 1
    end tell
end run