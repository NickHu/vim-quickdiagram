if !exists("g:quickdiagram_command")
  let g:quickdiagram_command = expand("<sfile>:h") . "/../bin/remarkable-screenshot.sh"
endif

if !exists("g:quickdiagram_options")
  let g:quickdiagram_options = {'directory': 'images'}
endif
