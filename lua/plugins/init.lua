return {
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup()
    end,
  },

  { 'tpope/vim-fugitive' },

  { 'tpope/vim-rhubarb' },

  { 'tpope/vim-sleuth' },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end
  },

  { 'chaoren/vim-wordmotion' },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
    config = function()
      local highlight = {
        "CursorColumn",
        "Whitespace"
      }
      require('ibl').setup {
        indent = {highlight = highlight, char = "" },
        whitespace = { highlight = highlight, remove_blankline_trail = false },
        scope = { enabled = false }
      }
    end
  },

  { 'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<C-_>',
        },
        opleader = {
          line = '<C-_>',
        }
      })
    end
  },

  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'catppuccin',
          component_separators = '|',
          section_separators = '',
        },
      }
    end
  },

  { 'kylechui/nvim-surround',
    config = function() require('nvim-surround').setup() end
  },

  { 'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        easing_function = "sine"
      })
    end
  },

  { 'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        copilot_node_command = vim.g.system_node,
      })
    end
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require("copilot_cmp").setup({})
    end
  },

  {
    'chipsenkbeil/distant.nvim',
    cond = not vim.g.is_windows,
    config = function()
      require('distant').setup {
        ['*'] = require('distant.settings').chip_default()
      }
    end
  },

}
