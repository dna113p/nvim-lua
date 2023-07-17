vim.g.is_windows = vim.loop.os_uname().sysname == "Windows_NT"

vim.g.home = os.getenv(vim.g.is_windows and 'HOMEPATH' or 'HOME')

vim.g.in_wsl = os.getenv('WSL_DISTRO_NAME')


if vim.g.in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
        paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
        cache_enabled = true
    }
end

if vim.fn.executable('volta') == 1 then
    vim.g.system_node = vim.fn.trim(vim.fn.system('cd '..vim.g.home.. ' && volta which node'))
    vim.g.node_host_prog = vim.g.system_node
    vim.g.copilot_node_command = vim.g.system_node
end
