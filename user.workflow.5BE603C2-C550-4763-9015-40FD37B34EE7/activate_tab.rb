# encoding: utf-8

browser, window_index, tab_index = ARGV[0].split
`osascript applescripts/#{browser}_activate_tab.applescript #{window_index} #{tab_index}`