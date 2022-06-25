:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard=unnamedplus
:set cmdheight=1
:set showmatch
:set ignorecase
:set hlsearch
:set cursorline
call plug#begin()

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'honza/vim-snippets' " Snippers
Plug 'thinca/vim-quickrun'
Plug 'luochen1990/rainbow' " For Colored parenthesis
Plug 'TovarishFin/vim-solidity'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'akinsho/toggleterm.nvim'
call plug#end()


colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:lsc_auto_map = v:true " For Dart Server
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
source ~/.config/nvim/coc.vim


