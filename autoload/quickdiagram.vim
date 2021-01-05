function! quickdiagram#write_image(filename, directory)
  call mkdir(a:directory, 'p')
  if has("nvim")
    call jobstart(g:quickdiagram_command . " " . a:directory . "/" . a:filename)
  else
    execute "!" . g:quickdiagram_command . " " . a:directory . "/" . a:filename
  endif
endfunction

function! quickdiagram#insert(name, opts)
  " TODO: use opts for things like specifying description, height, width etc.
  call quickdiagram#write_image(quickdiagram#make_filename(a:name), a:opts.directory)
  if a:opts.type == "markdown"
    call setline('.', "![" . a:name . "](" . a:opts.directory . "/" . quickdiagram#make_filename(a:name) . ")")
  elseif a:opts.type == "tex"
    call setline('.', "\\includegraphics{" . a:opts.directory . "/" . quickdiagram#make_filename(a:name) . "}")
  endif
endfunction

function! quickdiagram#make_filename(name)
  return substitute(a:name, " ", "-", "g")
endfunction
