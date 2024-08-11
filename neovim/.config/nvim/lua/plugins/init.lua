return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { 'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
      -- or                          , tag = '0.1.8',                             
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
}
