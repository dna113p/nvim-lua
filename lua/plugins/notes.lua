return {
  -- {
  --   "zk-org/zk-nvim",
  --   config = function()
  --     require("zk").setup({
  --       picker = "telescope",
  --       lsp = {
  --         -- `config` is passed to `vim.lsp.start_client(config)`
  --         config = {
  --           cmd = { "zk", "lsp" },
  --           name = "zk",
  --           -- on_attach = ...
  --           -- etc, see `:h vim.lsp.start_client()`
  --         },
  --
  --         -- automatically attach buffers in a zk notebook that match the given filetypes
  --         auto_attach = {
  --           enabled = true,
  --           filetypes = { "markdown" },
  --         },
  --       },
  --     })
  --   end
  -- },
  {
    "tools-life/taskwiki",
    dev = true,
  },
  {
    'jakewvincent/mkdnflow.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('mkdnflow').setup({
        modules = {
          bib = true,
          buffers = true,
          conceal = true,
          cursor = true,
          folds = true,
          links = true,
          lists = true,
          maps = true,
          paths = true,
          tables = true,
          yaml = false,
          cmp = true
        },
        filetypes = {md = true, rmd = true, markdown = true},
        create_dirs = true,
        perspective = {
          priority = 'current',
          fallback = 'root',
          root_tell = '.zk',
          nvim_wd_heel = false,
          update = false
        },
        wrap = false,
        bib = {
          default_path = nil,
          find_in_root = true
        },
        silent = false,
        cursor = {
          jump_patterns = nil
        },
        links = {
          style = 'markdown',
          name_is_source = false,
          conceal = false,
          context = 0,
          implicit_extension = nil,
          transform_implicit = false,
          transform_explicit = function(text)
            return(text)
          end
        },
        new_file_template = {
          use_template = false,
          placeholders = {
            before = {
              title = "link_title",
              date = "os_date"
            },
            after = {}
          },
          template = "# {{ title }}"
        },
        to_do = {
          symbols = {' ', '-', 'X'},
          update_parents = true,
          not_started = ' ',
          in_progress = '-',
          complete = 'X'
        },
        tables = {
          trim_whitespace = true,
          format_on_move = true,
          auto_extend_rows = false,
          auto_extend_cols = false,
          style = {
            cell_padding = 1,
            separator_padding = 1,
            outer_pipes = true,
            mimic_alignment = true
          }
        },
        yaml = {
          bib = { override = false }
        },
        mappings = {
          MkdnEnter = {{'n', 'v'}, '<CR>'},
          MkdnTab = false,
          MkdnSTab = false,
          MkdnNextLink = {'n', '<Tab>'},
          MkdnPrevLink = {'n', '<S-Tab>'},
          MkdnNextHeading = {'n', ']]'},
          MkdnPrevHeading = {'n', '[['},
          MkdnGoBack = {'n', '<BS>'},
          MkdnGoForward = {'n', '<Del>'},
          MkdnCreateLink = false, -- see MkdnEnter
          MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>lp'}, -- see MkdnEnter
          MkdnFollowLink = false, -- see MkdnEnter
          MkdnDestroyLink = {'n', '<leader>ld'},
          MkdnTagSpan = {'v', '<M-CR>'},
          MkdnMoveSource = {'n', '<F2>'},
          MkdnYankAnchorLink = {'n', 'yaa'},
          MkdnYankFileAnchorLink = {'n', 'yfa'},
          MkdnIncreaseHeading = {'n', '+'},
          MkdnDecreaseHeading = {'n', '-'},
          MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
          MkdnNewListItem = false,
          MkdnNewListItemBelowInsert = {'n', 'o'},
          MkdnNewListItemAboveInsert = {'n', 'O'},
          MkdnExtendList = false,
          MkdnUpdateNumbering = {'n', '<leader>nn'},
          MkdnTableNextCell = {'i', '<Tab>'},
          MkdnTablePrevCell = {'i', '<S-Tab>'},
          MkdnTableNextRow = false,
          MkdnTablePrevRow = {'i', '<M-CR>'},
          MkdnTableNewRowBelow = {'n', '<leader>ir'},
          MkdnTableNewRowAbove = {'n', '<leader>iR'},
          MkdnTableNewColAfter = {'n', '<leader>ic'},
          MkdnTableNewColBefore = {'n', '<leader>iC'},
          MkdnFoldSection = {'n', '<leader>f'},
          MkdnUnfoldSection = {'n', '<leader>F'}
        }
      })
    end
  }
}