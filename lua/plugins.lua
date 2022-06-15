local fn = vim.fn
local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(packer_path)) > 0 then
    vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
    fn.system { 'git', 'clone', '--depth', '1',
        'https://hub.fastgit.xyz/wbthomason/packer.nvim', packer_path }
    return
end

local packer = require('packer')
packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim' -- lua functions I don't want to write twice
        use 'kyazdani42/nvim-web-devicons'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'
        use 'L3MON4D3/LuaSnip'

        use { 'catppuccin/nvim', as = 'catppuccin',
            config = function()
                vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
                local cat = require("catppuccin")
                cat.setup {
                    integrations = {
                        native_lsp = {
                            enabled = true,
                            virtual_text = {
                                errors = "NONE",
                                hints = "NONE",
                                warnings = "NONE",
                                information = "NONE",
                            },
                        },
                        gitgutter = true,
                        nvimtree = {
                            enabled = true,
                            show_root = false,
                            transparent_panel = true,
                        },
                        neogit = true,
                    }
                }
                local cp = require 'catppuccin.api.colors'.get_colors()
                cat.remap {
                    ErrorMsg = { fg = cp.red, style = "NONE" },
                    TSProperty = { fg = cp.yellow, style = "NONE" },
                    TSInclude = { fg = cp.teal, style = "NONE" },
                    TSOperator = { fg = cp.sky, style = "NONE" },
                    TSKeywordOperator = { fg = cp.sky, style = "NONE" },
                    TSPunctSpecial = { fg = cp.maroon, style = "NONE" },
                    TSFloat = { fg = cp.peach, style = "NONE" },
                    TSNumber = { fg = cp.peach, style = "NONE" },
                    TSBoolean = { fg = cp.peach, style = "NONE" },
                    TSConditional = { fg = cp.mauve, style = "NONE" },
                    TSRepeat = { fg = cp.mauve, style = "NONE" },
                    TSException = { fg = cp.peach, style = "NONE" },
                    TSConstBuiltin = { fg = cp.lavender, style = "NONE" },
                    TSFuncBuiltin = { fg = cp.peach, style = "NONE" },
                    TSTypeBuiltin = { fg = cp.yellow, style = "NONE" },
                    TSVariableBuiltin = { fg = cp.teal, style = "NONE" },
                    TSFunction = { fg = cp.blue, style = "NONE" },
                    TSParameter = { fg = cp.rosewater, style = "NONE" },
                    TSKeywordFunction = { fg = cp.maroon, style = "NONE" },
                    TSKeyword = { fg = cp.red, style = "NONE" },
                    TSMethod = { fg = cp.blue, style = "NONE" },
                    TSNamespace = { fg = cp.rosewater, style = "NONE" },
                    TSStringRegex = { fg = cp.peach, style = "NONE" },
                    TSVariable = { fg = cp.white, style = "NONE" },
                    TSTagAttribute = { fg = cp.mauve, style = "NONE" },
                    TSURI = { fg = cp.rosewater, style = "underline" },
                    TSLiteral = { fg = cp.teal, style = "NONE" },
                    TSEmphasis = { fg = cp.maroon, style = "NONE" },
                    TSStringEscape = { fg = cp.pink, style = "NONE" },
                    bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
                    bashTSParameter = { fg = cp.yellow, style = "NONE" },
                    typescriptTSProperty = { fg = cp.lavender, style = "NONE" },
                    cssTSProperty = { fg = cp.yellow, style = "NONE" },
                }
                vim.cmd [[colorscheme catppuccin]]
            end
        }

        use { 'feline-nvim/feline.nvim',
            config = function()
                require('feline').setup {
                    components = require('catppuccin.core.integrations.feline'),
                }
            end
        }

        use { 'simrat39/symbols-outline.nvim',
            config = function()
                vim.g.symbols_outline = {
                    highlight_hover_item = false,
                    auto_preview = false,
                }
            end
        }

        use { 'preservim/nerdcommenter',
            config = function()
                vim.g.NERDCreateDefaultMappings = 0
                vim.g.NERDSpaceDelims = 1
                vim.g.NERDDefaultAlign = 'left'
            end
        }

        use { 'kyazdani42/nvim-tree.lua',
            config = function()
                require('nvim-tree').setup {
                    open_on_setup = true,
                    open_on_setup_file = true,
                    view = {
                        side = 'left'
                    }
                }
            end
        }

        use { 'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup {}
            end
        }

        use { 'TimUntersberger/neogit',
            config = function()
                require('neogit').setup {}
            end
        }

        use { 'folke/trouble.nvim',
            config = function()
                require('trouble').setup {}
            end
        }

        use { 'akinsho/bufferline.nvim',
            tag = "v2.*",
            config = function()
                require("bufferline").setup {}
            end
        }

        use { "akinsho/toggleterm.nvim",
            tag = 'v1.*',
            config = function()
                require("toggleterm").setup {}
            end
        }

        use { "nvim-telescope/telescope.nvim",
            config = function()
                require("telescope").setup {
                    pickers = {
                        git_files = {
                            theme = "dropdown",
                        }
                    },
                }
            end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require('nvim-treesitter.configs').setup {
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                }
                vim.cmd [[
                    set foldmethod=expr
                    set foldexpr=nvim_treesitter#foldexpr()
                ]]
            end
        }

        use { "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    show_current_context = true,
                    show_current_context_start = false,
                }
            end
        }

    end,

    config = {
        git = {
            default_url_format = 'https://hub.fastgit.xyz/%s'
        }
    }
})

vim.cmd([[
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
]])
