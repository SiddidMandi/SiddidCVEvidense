--terminal font is CaskaydiaCove Nerd Font Mono, download and put into 
-- ~/.local/share/fonts  and add .otf or .ttf into this directory

require('myOptions') -- for options -must go first, before plugins
require('myMappings') -- for mappings

vim.cmd[[
let g:plug_home='/home/siddid/.config/nvim/vimPlugPlugins'
call plug#begin()
Plug 'vimwiki/vimwiki', {'branch':'dev'}
Plug 'https://github.com/jalvesaq/Nvim-R', {'for': 'R,r'}
call plug#end()

]]
-- plugin configurations, must go next
require('myPlugins')
--require('/setup/vimVsnip') -not yet 
--

