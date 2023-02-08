
" :set number
" :set relativenumber
" :set autoindent
" :set tabstop=2
" :set shiftwidth=2
" :set softtabstop=2
" :set expandtab
" :set smarttab
" :set mouse=a
" :set clipboard=unnamedplus
" :set cmdheight=1
" :set showmatch
" :set ignorecase
" :set hlsearch
" :set cursorline
" :retab

" :set foldmethod=syntax
" :set foldnestmax=10
" :set nofoldenable
" :set foldlevel=2
call plug#begin()

" Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
" Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
" Plug 'jiangmiao/auto-pairs'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
" Plug 'Mofiqul/dracula.nvim'
Plug 'honza/vim-snippets' " Snippers
Plug 'thinca/vim-quickrun'
Plug 'luochen1990/rainbow' " For Colored parenthesis
Plug 'TovarishFin/vim-solidity'
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'akinsho/toggleterm.nvim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim' " Fuzzy Find 
" Plug 'tpope/vim-unimpaired' " Moving Code Blocks 
Plug 'http://github.com/jeetsukumaran/vim-buffergator' "Vim Buffers
Plug 'https://github.com/nbouscal/vim-stylish-haskell'
" Plug 'https://github.com/ap/vim-css-color'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/mattn/webapi-vim'
" Plug 'luukvbaal/nnn.nvim' " nnn File manager
" Plug 'nickeb96/fish.vim'
" Plug 'khaveesh/vim-fish-syntax'
" Plug 'wbthomason/packer.nvim'
call plug#end()


hi Normal guibg=NONE ctermbg=NONE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.




" nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NvimTreeToggle<CR>

" nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>



" nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:lsc_auto_map = v:true " For Dart Server
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


let g:rust_clip_command = 'xclip -selection clipboard'

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

syntax enable
filetype plugin indent on
if &shell =~# 'fish$'
    set shell=sh
endif

" convert this vim script to nvim lua configuration
" source ~/.config/nvim/coc.vim

