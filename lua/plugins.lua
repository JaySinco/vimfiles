local fn = vim.fn
local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(packer_path)) > 0 then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  fn.system{'git', 'clone', '--depth', '1', 
    'https://hub.fastgit.xyz/wbthomason/packer.nvim', packer_path}
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
    
    use { 'folke/tokyonight.nvim', config = function()
      vim.g.tokyonight_style = "storm"
      vim.g.tokyonight_italic_keywords = 0
      vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
      vim.cmd[[colorscheme tokyonight]]
    end}
    
    use {'preservim/nerdcommenter', config = function()
      vim.g.NERDCreateDefaultMappings = 0 -- dont't create mappings
      vim.g.NERDSpaceDelims = 1 -- add spaces after comment delimiters by default
      vim.g.NERDDefaultAlign = 'left' -- align line-wise comment delimiters flush left instead of following code indentation
    end}
    
    use { 'kyazdani42/nvim-tree.lua', config = function()
      require('nvim-tree').setup {
        open_on_setup = true,
        open_on_setup_file = true,
        view = {
            side = 'right'
        }
      }
    end}
    
    use { 'nvim-lualine/lualine.nvim', config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
        }
      }
    end}
    
    use { 'lewis6991/gitsigns.nvim', config = function()
      require('gitsigns').setup {}
    end}
    
    use { 'TimUntersberger/neogit' , config = function()
      require('neogit').setup {}
    end}
    
    use { 'folke/trouble.nvim', config = function()
      require('trouble').setup {}
    end}
    
    use { 'neovim/nvim-lspconfig', config = function()
      require('lspconfig').clangd.setup{}
    end}
    
    use { 'akinsho/bufferline.nvim', tag = "v2.*", config = function()
      require("bufferline").setup()
    end}
    
    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
      require("toggleterm").setup()
    end}
  end,

  config = {
    git = {
      default_url_format = 'https://hub.fastgit.xyz/%s'
    }
  }
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
