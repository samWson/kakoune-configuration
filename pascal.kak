# Pascal Programming language syntax highlighting for Kakoune editor.
#
# Reference: Free Pascal, https://freepascal.org
# Author: Samuel Wilson
# GitHub username: samWson
#
# This code is in the Public Domain. See the UNLICENSE file or
# https://unlicense.org/ for details.

# Detection
hook global BufCreate .*[.](pas) %{
	set-option buffer filetype pascal
}

# Initialization
hook global WinSetOption filetype=pascal %{
	require-module pascal
}

hook -group pascal-highlight global WinSetOption filetype=pascal %{
	add-highlighter window/pascal ref pascal
	hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/pascal }
}

provide-module pascal %[

# Highlighters
add-highlighter shared/pascal regions
add-highlighter shared/pascal/code default-region group
add-highlighter shared/pascal/string region -match-capture "'" "'" fill string
add-highlighter shared/pascal/comment region '//' '$' fill comment
add-highlighter shared/pascal/code/keyword regex \b(?i)(absolute|and|array|asm|begin|case|const|constructor|destructor|div|do|downto|else|end)\b 0:keyword

]
