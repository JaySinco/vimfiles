local dap = require('dap')

local lldb_vscode_path = '/usr/bin/lldb-vscode'
if vim.fn.has('win32') == 1 then
    lldb_vscode_path = 'C:/Program Files/LLVM/bin/lldb-vscode.exe'
end

dap.adapters.lldb = {
    type = 'executable',
    command = lldb_vscode_path,
    name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}
