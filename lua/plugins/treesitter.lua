local Treesitter = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate'
}

function Treesitter.config()

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.md_taskwarrior = {
    install_info = {
      url = "/home/dj/Source/tree-sitter-md-taskwarrior",
      files = {"src/parser.c"},
    }
  }

  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
      'c',
      'lua',
      'python',
      'rust',
      'typescript',
      'javascript',
      'vimdoc',
      'vim',
      'css',
      'scss',
      'java',
      'xml',
      'html',
      'markdown',
      'markdown_inline',
      'md_taskwarrior'
    },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<c-backspace>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }

end

return {
  Treesitter,
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {'nvim-treesitter/nvim-treesitter-context'}
}
