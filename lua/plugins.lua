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
        use 'nvim-lua/plenary.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use 'junegunn/fzf'
        use 'junegunn/fzf.vim'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'
        use 'L3MON4D3/LuaSnip'
        use 'simrat39/symbols-outline.nvim'

        use { 'folke/tokyonight.nvim', config = function()
            vim.g.tokyonight_style = "storm"
            vim.g.tokyonight_italic_keywords = 0
            vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
            vim.cmd [[colorscheme tokyonight]]
        end }

        use { 'preservim/nerdcommenter', config = function()
            vim.g.NERDCreateDefaultMappings = 0
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDDefaultAlign = 'left'
        end }

        use { 'kyazdani42/nvim-tree.lua', config = function()
            require('nvim-tree').setup {
                open_on_setup = true,
                open_on_setup_file = true,
                view = {
                    side = 'right'
                }
            }
        end }

        use { 'nvim-lualine/lualine.nvim', config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight',
                }
            }
        end }

        use { 'lewis6991/gitsigns.nvim', config = function()
            require('gitsigns').setup {}
        end }

        use { 'TimUntersberger/neogit', config = function()
            require('neogit').setup {}
        end }

        use { 'folke/trouble.nvim', config = function()
            require('trouble').setup {}
        end }

        use { 'akinsho/bufferline.nvim', tag = "v2.*", config = function()
            require("bufferline").setup()
        end }

        use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
            require("toggleterm").setup()
        end }

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
