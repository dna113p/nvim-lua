vim.g.is_windows = vim.loop.os_uname().sysname == "Windows_NT"

vim.g.home = os.getenv(vim.g.is_windows and 'HOMEPATH' or 'HOME')

vim.g.in_wsl = os.getenv('WSL_DISTRO_NAME')

if vim.g.in_wsl then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

if vim.fn.executable('volta') == 1 then
--     vim.g.system_node = vim.fn.trim(vim.fn.system('cd '..vim.g.home.. ' && volta which node'))
    vim.g.node_host_prog = vim.fn.trim(vim.fn.system("volta which neovim-node-host"))
end

P = function(v)
    print(vim.inspect(v))
    return v
end


