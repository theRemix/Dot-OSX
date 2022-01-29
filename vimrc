" Allow vim to break compatibility with vi
set nocompatible

" Map Leader to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" treat _ as word stops
" set iskeyword-=_


""""""""""""""""""""""""""""""""""""""""""""""""""
" => CLIPBOARD
" For vim compiled with
"   +xterm_clipboard
"   +clipboard
" Requires VcXsrv
""""""""""""""""""""""""""""""""""""""""""""""""""

" Clipboard
set clipboard=unnamed

" cause habits
vmap <leader>cc y
nmap <leader>vv p


""""""""""""""""""""""""""""""""""""""""""""""""""
" => LOAD PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/plugins.vim


""""""""""""""""""""""""""""""""""""""""""""""""""
" => BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""

" Search all files, e.g. node_modules/
nnoremap <silent> <leader>af :call fzf#vim#files('',
      \ {'source': 'ag -f -g "" -u', 'down': '40%'})<CR>


let g:python_host_prog = '/home/remix/.asdf/shims/python3'

" Show current line number
set number
" Show relative line numbers
set relativenumber

" Highlight cursor current line
set cursorline

" Set how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" For Haxe autocompletions
:set autowrite

" Fast editing of vimrc
" map <leader>e :e! ~/.vimrc<cr>

" Don't show mode since Airline does
set noshowmode


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Linter
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': [],
\}
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '💩'
let g:airline#extensions#ale#enabled = 0

let g:prettier#exec_cmd_async = 0

" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'


""""""""""""""""""""""""""""""""""""""""""""""""""
" => COLORS AND FONTS
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
" syntax enable

" set background=dark

" Theme, Colorscheme, & Font
" colorscheme sourcerer
" colorscheme murphy
" colorscheme industry
" colorscheme airship

set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" overrides
hi Visual  guifg=NONE guibg=#607080 gui=none
hi Comment  guifg=#9CA7B3 guibg=NONE gui=none

let g:airline_theme='ayu_mirage'

" IndentLine {{
" let g:indentLine_char = '│'
" let g:indentLine_first_char = '┃'
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " │	┃ ╎	╏ ┆	┇ ┊	┋
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" Set extra options when running in GUI mode
" if has("gui_running")
"   set guioptions-=T
"   set guioptions-=e
"   set t_Co=256
"   set guitablabel=%M\ %t
" endif

set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""
" => USER INTERFACE
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Disable scratch preview for autocomplete
set completeopt-=preview

" Always show current position
" set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" matchparen built in plugin, 2ms timeout
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=0

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set highlight cursor line
hi CursorLine cterm=none ctermbg=16 ctermfg=none

" Style verticle split separator
hi VertSplit cterm=none ctermbg=none ctermfg=23

" Change selected text bg color
hi Visual cterm=none ctermbg=9 ctermfg=none

""""""""""""""""""""""""""""""""""""""""""""""""""
" => FILES, BACKUPS, AND UNDO
""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile

" Turn on presistent undo
" means that you can undo even when you close a buffer/Vim
try
  set undodir=~/.vim/temp_dirs/undodir
  set undofile
catch
endtry


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

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Strip trailing spaces on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => VISUAL MODE RELATED
""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => MOVING AROUND
""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
map <C-h> <C-W>h
map <C-t> <C-W>j
map <C-n> <C-W>k
map <C-s> <C-W>l

" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-t> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-n> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-s> :TmuxNavigateRight<cr>
" nnoremap <silent> {Pkevious-Mapping} :TmuxNavigatePrevious<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Last Buffer
" nnoremap <C-6> :b#<cr>
" nnoremap <leader><leader> :b#<cr> # WHY THE FUCK DOES THIS NOT WORK, only works after sourcing vimrc again
" nnoremap <S-Tab> :b#<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

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
" => STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Show tabline
set showtabline=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" => ACK FOR SEARCHING
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ack after the selected text
" vnoremap <leader>ack :call VisualSelection('gv', '')<CR>
vnoremap <leader>agg :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
" map <leader>ac :Ack
" map <leader>ag :Ag

" Search and replace the selected text
" idk how to make this work or what it does! \" \"vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
"  xnoremap <silent> <leader>r :<C-U>%s/<C-R><C-R>=Escaped(VisualSelection('f', '')) . '/'<cr>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Go to next/prev search results
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => SPELLING CHECK
""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle and untoggle spell checking
map <leader>SP :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>SN ]s
map <leader>SP [s
map <leader>SA zg
map <leader>s? z=


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

" Remap VIM 0 to first non-blank character
map 0 ^

" Trim WhiteSpace
nnoremap <Leader>tws :%s/\s\+$//e<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Wrap selected with parenthesis/brackets
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Auto complete (, ", ', [
"   Replaced with Auto Pairs
" inoremap ( ()<esc>i
" inoremap [ []<esc>i
" inoremap { {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i

" Set Syntax
map <leader>sy :set syntax=

" Quick quit
map <leader>qq :q<cr>

" Quick file reload
map <leader>e :e<cr>

" Quick buffers reload
" map <leader>r :bufdo e<cr>

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

" Search current word without moving cursor
nnoremap<silent> K :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Quick macro invocation with q register
nnoremap Q @q

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Trigger build with make
map <leader>m :make<cr>

" Run JS with jsruntime.vim
" vnoremap <silent> <leader>b :<C-U>echo javascript#runtime#evalScript(GetSelectedText())<cr>
" vnoremap <silent> <leader>B :<C-U>call QuickShow( javascript#runtime#evalScript(GetSelectedText()))<cr>

" vnoremap <silent> <leader>b :<C-U>echo javascript#runtime#evalScript(@*)<cr>
" vnoremap <silent> <leader>b :call CmdLine('javascript#runtime#evalScript', '')

nmap <C-t> :vs#<CR>

" build go projects
autocmd FileType go map <buffer> <leader>b :GoRun<CR>
" test go projects
autocmd FileType go map <buffer> <leader>B :GoTest<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => HELPER FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""

func! QuickShow(str)
  let l:output = a:str
  lexpr l:output
  laddexpr ""
  lwindow
endfunc

func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  normal gv
  return result
endfunc

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

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
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


" Strip trailing spaces
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Format json
function! FormatJSON()
:%!python -m json.tool
endfunction


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" call NERDTreeHighlightFile('html', 202, 'none', '#FC4709', '#FC4709')
" call NERDTreeHighlightFile('hbs', 202, 'none', '#FC4709', '#FC4709')
" call NERDTreeHighlightFile('jade', 149, 'none', '#A0D24D', '#A0D24D')
" call NERDTreeHighlightFile('json', 223, 'none', '#FECEA0', '#FECEA0')
" call NERDTreeHighlightFile('scss', 44, 'none', '#1AD0CE', '#1AD0CE')
" call NERDTreeHighlightFile('css', 44, 'none', '#1AD0CE', '#1AD0CE')
" call NERDTreeHighlightFile('js', 226, 'none', '#FFFF0D', '#FFFF0D')
" call NERDTreeHighlightFile('rb', 197, 'none', '#E53378', '#E53378')
" call NERDTreeHighlightFile('md', 208, 'none', '#FD720A', '#FD720A')
" call NERDTreeHighlightFile('php', 140, 'none', '#9E6FCD', '#9E6FCD')
" call NERDTreeHighlightFile('svg', 178, 'none', '#CDA109', '#CDA109')
" call NERDTreeHighlightFile('gif', 36, 'none', '#15A274', '#15A274')
" call NERDTreeHighlightFile('jpg', 36, 'none', '#15A274', '#15A274')
" call NERDTreeHighlightFile('png', 36, 'none', '#15A274', '#15A274')
