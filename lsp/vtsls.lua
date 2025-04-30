return {
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'html',
  },
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
  settings = {
    typescript = {
      updateImportsOnFileMove = "always",
    },
    javascript = {
      updateImportsOnFileMove = "always",
    },
    vtsls = {
      enableMoveToFileCodeAction = true,
    },
  }
}
