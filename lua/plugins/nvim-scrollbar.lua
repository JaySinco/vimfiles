require("scrollbar").setup {
    handle = {
        text = " ",
        color = "gray",
        hide_if_all_visible = true,
    },
    marks = {
        Search = { text = { "-", "-" }, priority = 0, color = "orange" },
        Error  = { text = { "-", "-" }, priority = 1, color = "red" },
        Warn   = { text = { "-", "-" }, priority = 2, color = "yellow" },
        Info   = { text = { "-", "-" }, priority = 3, color = "blue" },
        Hint   = { text = { "-", "-" }, priority = 4, color = "green" },
        Misc   = { text = { "-", "-" }, priority = 5, color = "purple" },
    },
}
