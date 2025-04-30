return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less", "sass", "javascriptreact", "javascript", "typescriptreact", "typescript" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
