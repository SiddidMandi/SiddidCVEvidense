

--
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
let template_path = '~/.config/nvim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl'


let wiki_2 = {}
let wiki_2.path = '~/Documents/vimwiki/wiki_Academic'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let wiki_3 = {}
let wiki_3.path = '~/Documents/vimwiki/wiki_3'

let g:vimwiki_list = [wiki_1, wiki_2,wiki_3]
"

autocmd filetype vimwiki silent! iunmap <buffer> <Tab>

"autocmd filetype vimwiki silent! iunmap +
"autocmd filetype vimwiki silent! iunmap <buffer> +
"nnoremap! + <NOP>

"au filetype vimwiki silent! iunmap <buffer> <S-Tab>
]]  

--autocmd and au are the same
--this autocmd only applies to vimwiki extension
--and is fired when a filetype with that extensio is loaded up and only applie
--to the current buffer
--Since it only applies to vimwiki ext, then it only unmaps that function and
--doesn't touch vim ones.
--]]
