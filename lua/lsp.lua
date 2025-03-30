local telescope = require("telescope.builtin")

vim.lsp.enable('luals')
vim.lsp.enable('vtsls')
vim.lsp.enable('jsonls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local map, buf = vim.keymap.set, args.buf
    local nmap = function(k, f, d) map("n", k, f, { buffer = buf, desc = d and "LSP: " .. d }) end

    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

    -- Telescope
    nmap("gr", telescope.lsp_references, "[G]oto [R]eferences")
    nmap("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<leader>K", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(args.buf, "Format", function(_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
  end,
})
