vim.cmd([[
set nocompatible
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
set encoding=utf8
]])
-- 123456789 123456789 123456789 123456789 123456789 123456789 123456789
--
vim.cmd[[
set encoding=UTF-8
"colorscheme tokyonight-night 
set textwidth=80
]]

--vim.o.filetype=true
vim.o.syntax='true'
vim.o.number=true

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
