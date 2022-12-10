require("bufferline").setup {
    options = {
        always_show_bufferline = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = vim.fn.getcwd,
                highlight = "Directory",
                text_align = "left",
                separator = false, -- use a "true" to enable the default, or set your own character
            }
        }
    }
}
