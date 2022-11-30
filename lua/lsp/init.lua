local lsp_status = require('lsp-status')
lsp_status.register_progress()
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)
local navic = require("nvim-navic")

lsp_status.config({
    current_function = false,
    show_filename = false,
    diagnostics = false,
    status_symbol = '',
})

local on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    lsp_status.on_attach(client)
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
    handlers = lsp_status.extensions.clangd.setup(),
    init_options = {
        clangdFileStatus = true
    },
}

lspconfig['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- lspconfig['pyright'].setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.cmd [[
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
]]
