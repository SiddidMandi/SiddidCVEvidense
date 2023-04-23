vim.cmd([[
let g:airline_detect_whitespace=0
"disables whitespace extension
let g:airline#extensions#whitespace#enabled=0
"shows the tabline folder view on top
let g:airline#extensions#tabline#enabled = 0 "the thing on top 
let g:airline#extensions#wordcount#enabled=1

let g:airline_theme='oceanicnextminimal'

let g:airline_symbols={} "set dictionary first
let g:airline_symbols.linenr = '␤   ' "select symbol, or symbols next 
set noshowmode "this gets rid of --INSERT--
]])

vim.g.airline_detect_whitespace=false
--vim.g.airline#extensions#whitespace#enabled=false
--vim.g.airline#extensions#tabline#enabled=false 
-- to modify icons in vim airline status bar, first set dictionary
-- run :h airline to see the possible icons
