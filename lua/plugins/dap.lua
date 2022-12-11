local dap = require('dap')

-- c++ 
if vim.fn.has('unix') == 1 then
    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = 'lldb'
    }
end

-- python
dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        name = "Launch file",
        type = 'python',
        request = 'launch',
        program = "${file}",
    }
}

-- nodejs
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    -- git clone https://github.com/microsoft/vscode-node-debug2.git
    -- npm install && NODE_OPTIONS=--no-experimental-fetch npm run build
    args = { os.getenv(vim.fn.has('unix') == 1 and 'HOME' or 'USERPROFILE')
        .. '/ProgramFiles/vscode-node-debug2/out/src/nodeDebug.js' },   
}

dap.configurations.javascript = {
    {
        name = "Launch file",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        -- sourceMaps = true,
        protocol = 'inspector',
        -- console = 'integratedTerminal',
    },
    -- {
    --     name = "Attach to process",
    --     type = "node2",
    --     request = "attach",
    --     processId = require'dap.utils'.pick_process,
    -- }
}
