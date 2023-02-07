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

	-- -- Dashboard is a nice start screen for nvim
	-- use("glepnir/dashboard-nvim")


	-- use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

	-- -- Productivity
	-- use("vimwiki/vimwiki")
	-- use("jreybert/vimagit")
	-- use("nvim-orgmode/orgmode")

	-- use("folke/which-key.nvim") -- Which Key

	-- -- Tim Pope Plugins --
	-- use("tpope/vim-surround")


	-- -- Junegunn Choi Plugins --
	-- use("junegunn/goyo.vim")
	-- use("junegunn/limelight.vim")
	-- use("junegunn/vim-emoji")


  -- -- Coding Setup
  use {
    'neoclide/coc.nvim',
    branch = 'release'

  }
	use("ap/vim-css-color")
	use("nickeb96/fish.vim")
  -- -- Themes
  use("morhetz/gruvbox") -- GruvBox theme
  use("dracula/vim") -- Dracula Theme
  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- } -- Lua Line Status bar
  
  -- -- File Management
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

	if packer_bootstrap then
		packer.sync()
	end
end)


