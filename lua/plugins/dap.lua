local dap = require('dap')

if vim.fn.has('unix') == 1 then
    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = 'lldb'
    }
end

