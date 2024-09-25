local Telescope = { 
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
}
local Fzf = { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

function Telescope.config()
  require('telescope').setup {
    defaults = {
      layout_config = {
        height = 0.95,
        width = 0.90,
      },
      vimgrep_arguments = {
        "rg",
        "--hidden",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
          ["<C-j>"] = {
            require('telescope.actions').move_selection_next, type = "action",
            opts = { nowait = true, silent = true }
          },
          ["<C-k>"] = {
            require('telescope.actions').move_selection_previous, type = "action",
            opts = { nowait = true, silent = true }
          },
        },
      },
    },
  }
  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')

  vim.keymap.set('n', '<leader>f/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin')
    .current_buffer_fuzzy_find(require('telescope.themes')
    .get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer]' })

  vim.keymap.set('n', '<C-p>', function()
    require('telescope.builtin')
    .find_files({
      -- find_command={"rg","--ignore","--hidden","--glob", "!**/.git/**", "--files" },
      find_command={"fd", "--no-require-git"},
      prompt_prefix="🔍 ",
    })
  end, { desc = '[S]earch [F]iles' })

  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', require('telescope.builtin')
  .oldfiles, { desc = '[?] Find recently opened files' })

  vim.keymap.set('n', '<leader><space>', require('telescope.builtin')
  .buffers, { desc = '[ ] Find existing buffers' })

  vim.keymap.set('n', '<leader>sf', require('telescope.builtin')
  .find_files, { desc = '[S]earch [F]iles' })

  vim.keymap.set('n', '<leader>sh', require('telescope.builtin')
  .help_tags, { desc = '[S]earch [H]elp' })

  vim.keymap.set('n', '<leader>sw', require('telescope.builtin')
  .grep_string, { desc = '[S]earch current [W]ord' })

  vim.keymap.set('n', '<leader>sg', require('telescope.builtin')
  .live_grep, { desc = '[S]earch by [G]rep' })

  vim.keymap.set('n', '<leader>sd', require('telescope.builtin')
  .diagnostics, { desc = '[S]earch [D]iagnostics' })

end

return { Telescope, Fzf } 
