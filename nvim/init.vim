" enables syntax highlighting
syntax on

" Better colors
" set termguicolors

let mapleader = ' '

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers, relative
set number
set relativenumber

" columns used for the line number
set numberwidth=3

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" open splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

" window movement and tmux
nnoremap <C-h> <C-W>h
nnoremap <C-t> <C-W>j
nnoremap <C-n> <C-W>k
nnoremap <C-s> <C-W>l

" split window
nnoremap <leader>v <C-W>v

" Clipboard
set clipboard=unnamed

" quick copy and paste
vmap <leader>cc y
nmap <leader>vv p

" quick save
nnoremap <leader>w :w<cr>

" quick close
nnoremap <leader>qq :q<cr>

" buffers
nnoremap <leader><leader> :b#<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

call plug#begin('~/.config/nvim/plugged')

" vim one colorscheme
Plug 'joshdick/onedark.vim'

" vim airline
Plug 'vim-airline/vim-airline'
set noshowmode " hide original mode line

" Telescope and gitsigns requires plenary to function
Plug 'nvim-lua/plenary.nvim'

" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

" vim-fugitive
Plug 'tpope/vim-fugitive'

" gitsigns also requires plenary
Plug 'lewis6991/gitsigns.nvim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" dev icons
Plug 'kyazdani42/nvim-web-devicons'

" sidebar
Plug 'sidebar-nvim/sidebar.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
" Treesitter, improved syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

call plug#end()

" onedark colorscheme
let g:airline_theme='onedark'
let g:onedark_terminal_italics=1
colorscheme onedark

" gitsigns : placement of the signs
" set signcolumn=number
set signcolumn=yes

" Telescope mappings
nnoremap <C-p> :Telescope find_files<Cr>
nnoremap <C-g> :Telescope live_grep<cr>
nnoremap <leader>t :Telescope grep_string<cr>
nnoremap <C-b> :Telescope buffers<cr>
"nnoremap <leader>fh :Telescope help_tags<cr>
"nnoremap <leader>t :Telescope<cr>

" sidebar
nnoremap <C-e> :SidebarNvimFocus<Cr>


" lua requires
"
lua require('remix/telescope')
lua require('remix/gitsigns')
lua require('remix/sidebar')
lua require('remix/lsp')
lua require('remix/treesitter')
