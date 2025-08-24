return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  config = function ()
    require("codecompanion").setup({
      display = {
        chat = {
          show_settings = false,
        }
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "qwen2.5-coder:3b",
              },
            },

            env = {
              url = "http://192.168.88.4:11434"
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "ollama",
          model = "qwen2.5-coder:3b"
        },
        inline = {
          adapter = "ollama",
          model = "qwen2.5-coder:3b"
        },
      },
    })
  end
}
