vim.lsp.enable({ 'luals', 'vtsls', 'jsonls', 'gopls', 'cssls', 'ruff' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = function(d) return { buffer = args.buf, desc = d and "LSP: " .. d } end

    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts("[G]oto [I]mplementation"))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("[R]e[n]ame"))
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts("Rename"))
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts("Type [D]efinition"))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("[C]ode [A]ction"))

    -- Telescope
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "gr", telescope.lsp_references, opts("[G]oto [R]eferences"))
    vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols, opts("[D]ocument [S]ymbols"))
    vim.keymap.set("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, opts("[W]orkspace [S]ymbols"))

    -- See `:help K` for why this keymap
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover Documentation"))
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, opts("Signature Documentation"))

    -- Lesser used LSP functionality
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("[G]oto [D]eclaration"))

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(args.buf, "Format", function(_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
  end,
})
