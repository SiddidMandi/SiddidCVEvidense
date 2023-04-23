--terminal font is CaskaydiaCove Nerd Font Mono, download and put into 
-- ~/.local/share/fonts  and add .otf or .ttf into this directory
vim.cmd[[
let g:plug_home='/home/siddid/.config/nvim/vimPlugPlugins'
call plug#begin()
Plug 'vimwiki/vimwiki', {'branch':'dev'}
Plug 'https://github.com/jalvesaq/Nvim-R', {'for': 'R,r'}
Plug 'lervag/vimtex'
call plug#end()
]]
-- you can just copy and paste plugins in the vimPlugPlugins folder 
-- and run PlugInstall, it works no reinstall needed
-- for local plugins use Plug '/home/siddid/.config/nvim/PluginDirectory'
-- use function in packer works similarly to Plug in vimPlug
--
--require('myOptions') -- for options -must go first, before plugins
vim.cmd([[
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set scrolloff=8
set nobackup
set mouse=a
set foldcolumn=0
set signcolumn=no
set winheight=20
set encoding=utf8
set ignorecase
set relativenumber
set autochdir

set encoding=UTF-8
"colorscheme tokyonight-night 
set textwidth=75
"let g:coc_node_path_warning=0
]])
vim.o.syntax='true'
vim.o.number=true
vim.api.nvim_set_option("clipboard","unnamed")
vim.o.splitbelow=true

--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local highlights = {
      'Normal',
      'LineNr',
      'Folded',
      'NonText',
      'SpecialKey',
      'VertSplit',
      'SignColumn',
      'EndOfBuffer',
      'TablineFill', -- this is specific to how I like my tabline to look like
    }
    for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end 
end, 
})
-------------------------------------END OF OPTIONS-------------------

--require('myMappings') -- for mappings
vim.cmd[[nnoremap <space> <Nop>]]

vim.g.mapleader=" "
vim.g.maplocalleader=" "
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap= true, silent=true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap= true, silent=true})

local mapper = vim.api.nvim_set_keymap
local opts1 = {noremap=true, silent=true}
mapper('n', ';', ':', opts1)

mapper('n', '+', ':res +2<CR>', opts1)
mapper('n', '_', ':res -2<CR>', opts1)
mapper('n', '-', ':vertical resize -2<CR>', opts1)
mapper('n', '=', ':vertical resize +2<CR>', opts1)
mapper('n', '<C-s>', '<C-6>', opts1)
--local noX = '"_x'
mapper('n', 'x', '"_x' ,opts1) --if this no work see below -idk how to do
mapper('x', 'x', '"_x', opts1) 
mapper('n', 'dw', 'b"_dw', opts1) 
mapper('n', 'daw', 'b"_dw', opts1) 

mapper('v', '<S-i>', '^', opts1) -- stay in normal mode ok for visual
mapper('v', '<S-a>', '$', opts1) -- stay in normal mode 

-- Plugin binds GLOBAL
--mapper('n','<C-m>', ':NERDTreeToggle<CR>', opts1) --this causes CR to break
--
mapper('n', '<leader>n', ':NERDTreeToggle<CR>', opts1)
mapper('n','<C-t>',':g/\\.*section{/#<CR>', opts1) -- for section view

local builtin=require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, opts1)
--mapper('n','<C-u>', ':Limelight0.', opts1)

--cocConfig binds, see in setup
--imap <c-d> is jump to next trigger in snippet, cocCOnfig
--imap <c-f> is confirm snippet suggestion
--imap <tab> and <s-tab> is cycle through snippets and all
--END OF MAPPINGS-----------------------------------------------------



-- plugin configurations, must go next
require('myPlugins')

--END OF MAPPINGS-----------------------------------------------------
--Airline Configs-----------------------------------------------------
--maybe don't combine Plugin Options....




