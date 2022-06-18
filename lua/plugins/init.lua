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
        local rpath = function(name)
            return string.format("require('plugins.%s')", name)
        end

        -- theme
        use { 'sainnhe/gruvbox-material', config = rpath('gruvbox-material') }
        use { 'feline-nvim/feline.nvim', config = rpath('feline') }
        use { 'akinsho/bufferline.nvim', tag = "v2.*", config = rpath('bufferline') }

        -- lsp & autocomplete
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'
        use 'L3MON4D3/LuaSnip'

        -- git
        use 'sindrets/diffview.nvim'
        use { 'lewis6991/gitsigns.nvim', config = rpath('gitsigns') }
        use { 'TimUntersberger/neogit', config = rpath('neogit') }

        -- general
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim' -- lua functions I don't want to write twice
        use 'kyazdani42/nvim-web-devicons'
        use 'SmiteshP/nvim-navic' -- statusline component to show your current code context
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = rpath('nvim-treesitter') }
        use { 'simrat39/symbols-outline.nvim', config = rpath('symbols-outline') }
        use { 'preservim/nerdcommenter', config = rpath('nerdcommenter') }
        use { 'kyazdani42/nvim-tree.lua', config = rpath('nvim-tree') }
        use { 'folke/trouble.nvim', config = rpath('trouble') }
        use { 'rcarriga/nvim-notify', config = rpath('nvim-notify') }
        use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = rpath('toggleterm') }
        use { "nvim-telescope/telescope.nvim", config = rpath('telescope') }
        use { "lukas-reineke/indent-blankline.nvim", config = rpath('indent-blankline') }

    end,

    config = {
        git = {
            default_url_format = 'https://hub.fastgit.xyz/%s'
        }
    }
})
