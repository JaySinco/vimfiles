require("scrollbar").setup {
    show_in_active_only = true,
    handle = {
        text = " ",
        color = "#4d4d4d",
        hide_if_all_visible = true,
    },
    marks = {
        Search = { text = { "-", "-" }, priority = 0, color = "orange" },
        Error  = { text = { " ", " " }, priority = 1, color = "red" },
        Warn   = { text = { " ", " " }, priority = 2, color = "yellow" },
        Info   = { text = { " ", " " }, priority = 3, color = "blue" },
        Hint   = { text = { " ", " " }, priority = 4, color = "green" },
        Misc   = { text = { " ", " " }, priority = 5, color = "purple" },
    },
    handlers = {
        cursor = false,
        diagnostic = false,
        gitsigns = false,
        handle = true,
        search = false,
    },
}