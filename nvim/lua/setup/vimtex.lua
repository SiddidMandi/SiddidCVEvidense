--vim.g:vimtex_view_method='zathura'
-- <c-t> binding in myMappings.lua
--

--vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap= true})
vim.g.vimtex_view_method='zathura'
vim.g.tex_pdf_viewer='zathura'
vim.cmd[[
let g:tex_pdf_viewer = 'zathura'
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
let g:tex_flavour='latex'
let g:vimtex_view_method = 'zathura' "must be zathura

]]
-- install pygmentize using python 3, python3 -m pip3 install pygments
--
