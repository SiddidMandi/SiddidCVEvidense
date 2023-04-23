
set nocompatible

"GeneralSettings
nnoremap <space> <Nop>
let mapleader=' '
let maplocalleader=' '
inoremap kj <Esc>
nnoremap + :res +5<CR>
nnoremap _ :res -5<CR> 

filetype on

filetype plugin on

filetype indent on

syntax on
set number

set scrolloff=10

set nobackup

set mouse=a

set foldcolumn=0

set signcolumn=no

set winheight=20

set lines=20 

"set relativenumber


"colorscheme oceanicnext set it after the plugin thing
"
"the plug ins, inside go plug 'link'

"colorscheme oceanicnextcompletion, completion confirm




let g:NERDTreeWinSize=30

let g:limelight_priority=-1


"airline configurations ----------------------------------------
"set list
"set listchars+=space: 
let g:airline_detect_whitespace=0
"disables whitespace extension
let g:airline#extensions#whitespace#enabled=0
"shows the tabline folder view on top 
let g:airline#extensions#tabline#enabled = 0 "the thing on top "

" coc shit and text aid here ----------------------------------------------------
source $HOME/.config/nvim/plug-config/coc.vim " this can be used to import extra vimscript
"use commands :set spell and :set nospell for spell check and off
let g:coc_snippet_next = '<tab>' "this is the one, you are using coc
inoremap <silent><expr> <C-f> coc#pum#visible() ? coc#pum#confirm()
                               \:   "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
			      " done in coc config also 
"this command here binds it to choosing snippet
"let g:coc_snippet_expand = '<space>' "useless setting
"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>
"inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>
"the coc#pum#prev and next are in coc config, pum#prev also deletes characters
"and tabs 


"latex business ------------------------------------------------------------
"syntax enable
"section view command bind here
let g:tex_flavour = 'latex' "allows better syntax highlighting in latex
"let g:vimtex_minted_languages = [ 'cpp', 'c', 'python' ]
"let g:vimtex_lstlisting_languages = [ 'cpp', 'c', 'python' ]
"let g:vimtex_syntax_minted = [ {'lang':'cpp'} ]
"to learn more about syntax highlighting :h vimtex   and search for /minted
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
"you gotta install pygmentize using python3, python3 -m pip3 install
"pygments
let g:vimtex_view_method = 'zathura' "must be zathura
"ultisnips and triggers, tantamount to tabstops
    "let g:UltiSnipsExpandTrigger = '<tab>'
    "let g:UltiSnipsJumpForwardTrigger = '<tab>'
    "let g:UltiSnipsJumpBackwardTrigger = '<tab>'
    
call vimtex#imaps#add_map({
  \ 'lhs' : '<m-i>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate"],
  \})



"Vim Wiki stuff---------------------------------------------------------------
"path set 
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
let wiki_1.html_template = '~/Documents/vimwikiHTLM/wiki_Personal'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.custom_wiki2html = '~/Documents/wiki2html.sh'


let wiki_2 = {}
let wiki_2.path = '~/Documents/vimwiki/wiki_Academic'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.custom_wiki2html = '~/Documents/wiki2html.sh'

let wiki_3 = {}
let wiki_3.path = '~/Documents/vimwiki/wiki_3'

let g:vimwiki_list = [wiki_1, wiki_2,wiki_3]
" :h wimwiki_list
"
"
"
"
"
"
"
"
"
