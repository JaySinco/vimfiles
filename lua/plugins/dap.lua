local dap = require('dap')

if vim.fn.has('unix') == 1 then
    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = 'lldb'
    }
end

dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        name = "Debug file",
        type = 'python',
        request = 'launch',
        program = "${file}",
    }
}
