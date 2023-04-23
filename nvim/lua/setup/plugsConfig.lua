--AIRLINE CONFIGURATIONS----------------------------------------------
vim.cmd([[
let g:airline_detect_whitespace=0
"disables whitespace extension
let g:airline#extensions#whitespace#enabled=0
"shows the tabline folder view on top
let g:airline#extensions#tabline#enabled = 0 "the thing on top 
let g:airline#extensions#wordcount#enabled=1
let g:airline_theme='oceanicnextminimal'
let g:airline_symbols={} "set dictionary first
let g:airline_symbols.linenr = '␤  ' "select symbol, or symbols next 
set noshowmode "this gets rid of --INSERT--
]])
vim.g.airline_detect_whitespace=false
--vim.g.airline#extensions#whitespace#enabled=false
--vim.g.airline#extensions#tabline#enabled=false 
-- to modify icons in vim airline status bar, first set dictionary
-- run :h airline to see the possible icons


--COC CONFIGURATION---------------------------------------------------
--the double tab bind can only be done in vimscript, no let.g.coc.next.trigger = <tab> could help 
-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"
--local keyset=vim.keymap.set
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.g.coc_snippet_next = '<tab>'
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
vim.keymap.set("i", "<c-f>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)


--INDENT BANKLINE-----------------------------------------------------
vim.g.indent_bankline_show_current_context=true
vim.cmd[[let g:indent_bankline_show_current_context = v:true]]


--COLOR SCHEME CONFIGURATION------------------------------------------
vim.cmd[[
syntax enable
colorscheme OceanicNext
]]


--VIMTEX CONFIGURATION------------------------------------------------
vim.cmd[[
let g:tex_flavour='latex'
let g:vimtex_view_method = 'zathura' "must be zathura
call vimtex#imaps#add_map({
  \ 'lhs' : '<m-i>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate"],
  \})
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

augroup quickfix_autocmds
  autocmd!
  autocmd BufReadPost quickfix 2wincmd _
augroup END
]]
-- install pygmentize using python 3, python3 -m pip3 install pygments


--VIMWIKI CONFIGURATION-----------------------------------------------
vim.cmd[[
let g:vimwiki_table_mappings = 0
"for the link thing, go to ftplugin/vimwiki.vim in local plugged 
" disable table mappings
" https://github.com/vimwiki/vimwiki/issues/1093

"let g:vimwiki_list = [{'path': '~/Documents/vimwiki/','syntax':'markdown','ext':'.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
" sets syntax to markdonw instead
" multiple wikis, look at vimwiki_list path, must match 
let wiki_1 = {}
let wiki_1.path = '~/Documents/vimwiki/wiki_Personal'

let wiki_2 = {}
let wiki_2.path = '~/Documents/vimwiki/wiki_Academic'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let wiki_3 = {}
let wiki_3.path = '~/Documents/vimwiki/wiki_3'

let g:vimwiki_list = [wiki_1, wiki_2,wiki_3]

autocmd filetype vimwiki silent! iunmap <buffer> <Tab>
au filetype vimwiki silent! iunmap <buffer> <S-Tab>
]]  
--autocmd and au are the same
--this autocmd only applies to vimwiki extension
--and is fired when a filetype with that extensio is loaded up and only applie
--to the current buffer
--Since it only applies to vimwiki ext, then it only unmaps that function and
--doesn't touch vim ones.
--]]
