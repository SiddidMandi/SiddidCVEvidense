print("hello") --it works

--options
vim.opt.number = true

-- remaps, no plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})

local packer = require('packer')

packer.startup{function(use)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1', -- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {  
		'jalvesaq/Nvim-R', ft={ 'r','R' }
	}  
	use {
		'nvim-treesitter/nvim-treesitter', --{run = ':TSUpdate'}
	}
	use {'nvim-treesitter/playground'}
  -- plugins install go above
end,
config = {
  -- The root has to be a directory named "pack"
  package_root = vim.fn.stdpath('config') .. '/packer/pack',
}}

vim.o.packpath = vim.o.packpath .. ',' .. vim.fn.stdpath('config') .. '/packer' -- without "/pack"
---------------------------------------------

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local highlights = {
      'Normal',
      'LineNr',
      'Folded',
      'NonText',
      'SpecialKey', 'VertSplit',
      'SignColumn',
      'EndOfBuffer',
      'TablineFill', -- this is specific to how I like my tabline to look like
    }
    for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end 
end, 
})
vim.cmd("colorscheme OceanicNext")


--remaps, global plugins
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--Global plugins
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


