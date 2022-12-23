let mapleader = ' '

" enables syntax highlighting
syntax on

" Better colors
set termguicolors

" Use Unix as the standard file type
set ffs=unix,dos,mac

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

" Highlight cursor current line
set cursorline

" Set how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" hide original mode line
set noshowmode 

" Ignore compiled files
" wildignore is for commandline completion, like :color <tab>
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*,*/.DS_Store

" Clipboard
set clipboard=unnamed

" Disable markdown autofold
set nofoldenable
set foldmethod=expr

" use fzf
set rtp+=/opt/homebrew/opt/fzf

""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""

" Exit insert mode with `jk`
inoremap jk <ESC>

" Fast saving
nmap <leader>w :w!<cr>

" Indent/Unindent
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv

" Wrap selected with parenthesis/brackets
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" quick copy and paste
vmap <leader>cc y
nmap <leader>vv p

" quick save
nnoremap <leader>w :w<cr>

" quick close
nnoremap <leader>qq :q<cr>

" Quick file reload
map <leader>e :e<cr>

" Quick Open Notes
let g:notes_folder = '~/Documents/vim-notes/'
let g:note_size = 15

" Open global notes
let g:global_notes = g:notes_folder . 'global-notes.md'
map <leader>nn :execute ':topleft split ' . g:global_notes<cr>:execute ':resize' . g:note_size<cr>

" Project specific notes
let g:notes = g:notes_folder . fnamemodify(getcwd(), ':t') . '.md'
" Open current project notes
map <leader>n :execute ':topleft split ' . g:notes<cr>:execute ':resize' . g:note_size<cr>

" Toggle quotes for json file
map <leader>" :call ConcealJsonToggle()<cr>
let g:toggle_json_conceal=0

" List contents of all registers
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Paste in visual mode without updating default register
vnoremap p "_c<Esc>p

" Delete selected words without updating default register
vnoremap <leader>d "_d

" Saner behavior of n and N
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" Quick macro invocation with q register
nnoremap Q @q

" JSON Format
nnoremap <leader>J :%!python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => TEXT, TAB, AND INDENT RELATED
""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Number of spaces to use for indent and unindent
set shiftwidth=2
" Visible width of tabs
set tabstop=2

" number of spaces in a <Tab>
" set tabstop=4
" set softtabstop=4
" set expandtab


" Linebreak on 500 characters
" set lbr
" set tw=500

" set ai "Auto indent
" set si "Smart indent
set wrap "Wrap lines

" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " │	┃ ╎	╏ ┆	┇ ┊	┋
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""
" => VISUAL MODE RELATED
""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Search and replace the selected text
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => MOVING AROUND
""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
" breaks 5 j or 5 k though
" map j gj
" map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" window movement and tmux
nnoremap <C-h> <C-W>h
nnoremap <C-t> <C-W>j
nnoremap <C-n> <C-W>k
nnoremap <C-s> <C-W>l

" split window
nnoremap <leader>v <C-W>v

" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-t> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-n> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-s> :TmuxNavigateRight<cr>
" nnoremap <silent> {Pkevious-Mapping} :TmuxNavigatePrevious<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" last buffer
nnoremap <leader><leader> :b#<cr>

" rotate buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%

" vim-tmux-navigator faster shell
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""""""""""""""""
" => HELPER FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ack \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction


" Toggle quotes for json file
function! ConcealJsonToggle()
  if g:toggle_json_conceal
    set conceallevel=2
    let g:toggle_json_conceal=0
  else
    set conceallevel=0
    let g:toggle_json_conceal=1
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" colorscheme
" Plug 'joshdick/onedark.vim'
Plug 'TroyFletcher/vim-colors-synthwave'

" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
" Plug 'sidebar-nvim/sidebar.nvim'

" easymotion
Plug 'easymotion/vim-easymotion'

" Markdown, folding and syntax highlighting
Plug 'preservim/vim-markdown'

" surround
Plug 'tpope/vim-surround'

" autopairs
Plug 'windwp/nvim-autopairs'

" comments
Plug 'tpope/vim-commentary'

" LSP
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'
" Treesitter, improved syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Godot lang
Plug 'habamax/vim-godot'

" Terraform syntax
Plug 'hashivim/vim-terraform'

call plug#end()

" onedark colorscheme
" colorscheme onedark
" let g:airline_theme='onedark'
" let g:onedark_terminal_italics=1
"
" synthwave colorscheme
colorscheme synthwave
let g:airline_theme='kolor'

" gitsigns : placement of the signs
" set signcolumn=number
set signcolumn=yes

" automatically trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Telescope mappings
nnoremap <C-p> :Telescope find_files<Cr>
nnoremap <C-f> :Telescope find_files<Cr>
nnoremap <C-g> :Telescope live_grep<cr>
nnoremap <leader>t :Telescope grep_string<cr>
nnoremap <C-b> :Telescope buffers<cr>
"habits
nnoremap <leader>o :Telescope buffers<cr> 
"nnoremap <leader>fh :Telescope help_tags<cr>
"nnoremap <leader>t :Telescope<cr>

" sidebar
" nnoremap <C-e> :SidebarNvimFocus<Cr>

" Git Mappings
nnoremap <leader>G :Git<cr>
nnoremap <leader>Gc :Git commit<cr>
nnoremap <leader>Gps :Git -c push.default=current push<cr>

" easymotion
"
" search one key
nmap s <Plug>(easymotion-overwin-f)
" search two keys
nmap <leader>s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>b <Plug>(easymotion-linebackward)

" vsnip
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Godot
func! GodotSettings() abort
    let g:godot_executable = '/Applications/Godot.app'
    " setlocal foldmethod=expr
    setlocal tabstop=4
    setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

" lua requires
lua require('remix/telescope')
lua require('remix/gitsigns')
" lua require('remix/sidebar')
lua require('remix/lsp')
lua require('remix/treesitter')
lua require('remix/autopairs')
