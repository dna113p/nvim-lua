return {
  {
    'vimwiki/vimwiki',
    init = function()
      vim.g.vimwiki_list = {
        {
          path = '/mnt/d/vault/',
          syntax = 'markdown',
          ext = '.md'
        }
      }
    end
  },

  {
    'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup()
    end
  },

  {
    'tools-life/taskwiki'
  }
}
