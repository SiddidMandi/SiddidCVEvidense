require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = { "c", "lua", "vim", "help", "query", "javascript", "typescript", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  parser_install_dir ="/home/siddid/.config/nvim/parsers",
  auto_install = false,

  highlight = {
    enable = true,

    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.runtimepath:append("/home/siddid/.config/nvim/parsers")
