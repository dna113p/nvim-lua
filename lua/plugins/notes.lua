return {
  {
    "tools-life/taskwiki",
    enabled = ! vim.g.is_windows,
    config = function()
      -- Execute this command when Neovim starts, setting the Taskwiki sort order
      vim.g.taskwiki_sort_orders = {
        O = 'entry-'
      }

      -- Function to set Taskwiki keybindings with descriptions
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'TaskWiki: ' .. desc
        end
        vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
      end

      -- Defining TaskWiki keybindings
      nmap('<leader>ta', ':TaskWikiAnnotate<CR>', '[A]nnotate Task')
      nmap('<leader>te', ':TaskWikiEdit<CR>', '[E]dit Task')
      nmap('<leader>tbl', ':TaskWikiBufferLoad<CR>', '[B]uffer [L]oad')
      nmap('<leader>tr', ':TaskWikiBufferLoad<CR>', '[B]uffer [R]eload')
      nmap('<leader>tbs', ':TaskWikiBufferSave<CR>', '[B]uffer [S]ave')
      nmap('<leader>tcp', ':TaskWikiChooseProject<CR>', '[C]hoose [P]roject')
      nmap('<leader>tct', ':TaskWikiChooseTag<CR>', '[C]hoose [T]ag')
      nmap('<leader>tx', ':TaskWikiDelete<CR>', 'Delete Task')
      nmap('<leader>tc', ':TaskWikiDone<CR>', 'Task [C]omplete')
      nmap('<leader>tm', ':TaskWikiMod<CR>', '[M]odify Task')
      nmap('<leader>t<space>', ':TaskWikiToggle<CR>', 'Toggle Task Status')
    end,
    dev = true,
  },
}
