return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require('catppuccin').setup({
      transparent_background = false,
    })
    vim.cmd([[colorscheme catppuccin]])
  end
}
