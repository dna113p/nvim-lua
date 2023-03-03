local home = os.getenv('HOME')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.jdtls-data/' .. project_name

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local config = {
  capabilities = capabilities,
  cmd = {
    -- 💀
    home .. '/.sdkman/candidates/java/17.0.6-ms/bin/java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', home .. '/Source/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', home .. '/Source/jdtls/config_linux',
    '-data', workspace_dir
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    java = {
      configuration = {
        runtimes = {
          { name = 'JavaSE-17',  path = home .. '/.sdkman/candidates/java/17.0.6-ms' },
          { name = 'JavaSE-1.8', path = home .. '/.sdkman/candidates/java/jdk1.8.0_271' },
        }
      }
    }
  }
}

require('jdtls').start_or_attach(config)
