
require('/setup/airline')

--[[
if vim.g.loaded_vimtex then
  require('/setup/vimtex')
end
]]
--[[
if not package.loaded["vimtex"] then
  require("/setup/vimtex")
end
]]
vim.cmd[[
autocmd FileType tex lua require('/setup/vimtex')
]]
--load the vimtex module for tex files only, i.e. the only filetype the plugin
--loads up for

require('/setup/cocConfig')
require('/setup/oceanicNext')
--require('/setup/multiCarets') --breaks <CR>, use defaults for this plugin
--require('/setup/indent_bankline').require{
  --show_current_context = true,	
--}
require('/setup/indentBankline')
--require('/setup/limeLight')
require('/setup/vimwiki')


