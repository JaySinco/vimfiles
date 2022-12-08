require("dapui").setup {
    layouts = {
        {
            elements = {
                -- { id = "watches", size = 0.25 },
                { id = "breakpoints", size = 0.2 },
                { id = "stacks", size = 0.3 },
                { id = "scopes", size = 0.5 },
            },
            size = 60, -- columns
            position = "left",
        },
        {
            elements = {
                -- "console",
                "repl",
            },
            size = 0.5, -- % of total lines
            position = "bottom",
        },
    },
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.cmd [[
   augroup daprepl
       autocmd FileType dap-repl set nobuflisted
    augroup end
]]

vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939' }, false)
vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef' }, false)
vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379' }, false)

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='', numhl= '' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='', numhl= '' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='', numhl= '' })
