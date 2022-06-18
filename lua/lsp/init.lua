local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
end

lspconfig['sumneko_lua'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig['clangd'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.cmd [[
    autocmd BufWritePre * lua vim.lsp.buf.format()
]]
