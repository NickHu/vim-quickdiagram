let b:quickdiagram_options = g:quickdiagram_options
let b:quickdiagram_options.type = "markdown"
nnoremap <script> <silent> <leader>D
          \ :call quickdiagram#insert(getline('.'), b:quickdiagram_options)<CR>
