return {
  cmd = { "css-variables-language-server", "--stdio" },
  filetypes = { "css", "scss", "less", "sass", "javascriptreact", "javascript", "typescriptreact", "typescript" },
  root_markers = { "package.json", ".git" },
  settings = {
    cssVariables = {
      blacklistFolders = { "**/.cache", "**/.DS_Store", "**/.git", "**/.hg", "**/.next", "**/.svn", "**/bower_components", "**/CVS", "**/dist", "**/node_modules", "**/tests", "**/tmp" },
      lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" }
    }
  }
}
