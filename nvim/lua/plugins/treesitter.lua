return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  -- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'html',
      'lua',
      'luadoc',
      'vim',
      'typescript',
      'css',
      'angular'
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
