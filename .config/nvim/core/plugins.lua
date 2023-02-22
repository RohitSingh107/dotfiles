local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Dashboard is a nice start screen for nvim
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  } -- nvim dashboard

	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- -- Orgmode
  use {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup{}
  end
  }
  
  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  -- -- Coding Setup
  use {
    'neoclide/coc.nvim',
    branch = 'release'

  }
	use("nickeb96/fish.vim")
  use("tpope/vim-commentary")
  use("rust-lang/rust.vim")
  use("dart-lang/dart-vim-plugin")
  use("natebosch/vim-lsc")
  use("natebosch/vim-lsc-dart")
  use("thosakwe/vim-flutter")
  use("ap/vim-css-color")
  use("ryanoasis/vim-devicons")
  use("mg979/vim-visual-multi")
  use("honza/vim-snippets")
  use("luochen1990/rainbow")
  use("TovarishFin/vim-solidity")
  -- use{ 'anuvyklack/pretty-fold.nvim',
  --    config = function()
  --       require('pretty-fold').setup()
  --    end
  -- }


  -- -- Themes
  use("morhetz/gruvbox") -- GruvBox theme
  use("dracula/vim") -- Dracula Theme

  -- -- File Management
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")




	if packer_bootstrap then
		packer.sync()
	end
end)


  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- } -- Lua Line Status bar
  -- use("vimwiki/vimwiki")
	-- use("jreybert/vimagit")
