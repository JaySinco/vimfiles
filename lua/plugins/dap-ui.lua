require("dapui").setup {
    layouts = {
        {
            elements = {
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
                { id = "scopes", size = 0.25 },
            },
            size = 40, -- columns
            position = "right",
        },
        {
            elements = {
                -- "console",
                "repl",
            },
            size = 0.35, -- % of total lines
            position = "bottom",
        },
    },
    render = {
        max_type_length = 0, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    local tree = require('nvim-tree')
    tree.toggle(false, true)
    dapui.open()
    tree.toggle(false, true)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939' }, false)
vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef' }, false)
vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379' }, false)

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='', numhl= '' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='', numhl= '' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='', numhl= '' })
