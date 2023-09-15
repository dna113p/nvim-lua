-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- [[ Change line number mode in insert ]] --
local enable_auto_lines = 1

function Enable_auto_lines()
  enable_auto_lines = 1
  vim.o.relativenumber = true
end

-- Function to disable relative line numbers
function Disable_auto_lines()
  enable_auto_lines = 0
  vim.o.relativenumber = false
end

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    if enable_auto_lines == 1 then
      vim.o.relativenumber = true
    else
      vim.o.relativenumber = false
    end
  end
})
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.o.relativenumber = false
  end
})

-- Custom Vim commands to toggle relative line numbers
vim.cmd("command! EnableAutoLines lua Enable_auto_lines()")
vim.cmd("command! DisableAutoLines lua Disable_auto_lines()")
