""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
" 	\ 'do': 'yarn install',
" 	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Silver searcher
Plug 'rking/ag.vim'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" BufExplorer quickly and easily switch between buffer
Plug 'jlanzarotta/bufexplorer'

" Tree explorer for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Snippet files for various programming languages
" Plug 'honza/vim-snippets'

" Linter
" Plug 'w0rp/ale'

" Tmux statusline generator with support for airline
Plug 'edkolev/tmuxline.vim'

" Ayu theme
Plug 'ayu-theme/ayu-vim'

" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Visually select larger regions of text using the same key combination
Plug 'terryma/vim-expand-region'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Enable repeating supported plugin maps
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Display indention levels with vertical lines
Plug 'Yggdroot/indentLine'

" Undo history visualizer
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
"
" DISABLED FOR NOW CAUSE ITS SLOW AND I DONT USE IT ENOUGH
" Plug 'vim-ctrlspace/vim-ctrlspace'
" let g:ctrlspace_default_mapping_key = '<C-@>'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Shows a git diff in the gutter
" DISABLED FOR NOW CAUSE ITS VERY SLOW!
Plug 'airblade/vim-gitgutter'

" Instant Markdown previews
" Requires npm -g install instant-markdown-d
" Plug 'suan/vim-instant-markdown'

" Sublime Text style multiple selections
Plug 'terryma/vim-multiple-cursors'

" Paste in Vim with indentation adjusted to destination context
" Plug 'sickill/vim-pasta'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Add filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons'

" Zoom in/out of windows
Plug 'regedarek/ZoomWin'

" Ctrl SF
Plug 'dyng/ctrlsf.vim'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Vim TaskWarrior
" Plug 'blindFS/vim-taskwarrior'

" Vim HardTime
" Plug 'takac/vim-hardtime'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'

" Vim MDX JS
" Plug 'jxnblk/vim-mdx-js'

" Vim Erlang
" Plug 'vim-erlang/vim-erlang-runtime'

" Elixir
" Plug 'elixir-lang/vim-elixir'

" Vim graphql
" Plug 'jparise/vim-graphql'

" Systemd syntax
" Plug 'Matt-Deacalion/vim-systemd-syntax'

" Vim Go
Plug 'fatih/vim-go'

" Vim Ruby
Plug 'vim-ruby/vim-ruby'

" Vim Typescript
Plug 'leafgarland/typescript-vim'

" HCL Format
Plug 'fatih/vim-hclfmt'

" HCL Syntax
Plug 'jvirtanen/vim-hcl'

" Javascript Prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Nginx syntax
Plug 'vim-scripts/nginx.vim'

" Coffeescript syntax
Plug 'kchmck/vim-coffee-script'

" Svelte syntax
Plug 'evanleck/vim-svelte', {'branch': 'main'}
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0

" Toml syntax
Plug 'cespare/vim-toml'

" Haxe Plugin
Plug 'jdonaldson/vaxe'

" Starlark lang
" Plug 'cappyzawa/starlark.vim'

" Terraform lang
Plug 'hashivim/vim-terraform'

" Godot
Plug 'habamax/vim-godot'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN SPECIFC CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" coc plugin
""""""""""""""""""""""""""""""

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

""""""""""""""""""""""""""""""
" vim-godot plugin
""""""""""""""""""""""""""""""

" to use folding provided by plugin
func! GodotSettings() abort
    let g:godot_executable = '/Applications/Godot.app'
    " setlocal foldmethod=expr
    " setlocal tabstop=4
    setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

""""""""""""""""""""""""""""""
" vim-go plugin
""""""""""""""""""""""""""""""
" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
let g:go_test_timeout = '30s'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

""""""""""""""""""""""""""""""
" bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='mru'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" MRU plugin
""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400


""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20

" let g:ctrlp_map = '<C-f>'
" map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = 'public\|node_modules\|bower_components\|^\.DS_Store\|^\.git\|^\.coffee'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|node_modules|bower_components)$',
  \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
  \ 'link': '',
  \ }


" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '40%' }
" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Search project files, respecting git ignore
nnoremap <silent> <C-f> :FZF<CR>
" Search all files, e.g. node_modules/
nnoremap <silent> <leader>af :call fzf#vim#files('',
      \ {'source': 'ag --path-to-ignore ~/.ignore -f -g "" -u', 'down': '40%'})<CR>
" Search MRU buffers
nnoremap <silent> <leader>f :Buffers<CR>
nnoremap <silent> <leader>` :Marks<CR>

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test'
" nnoremap <silent> <leader>t :Tags<CR>

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.js.map$', '\.DS_Store$']
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable = '✦'
let g:NERDTreeDirArrowCollapsible = '✧'
map <C-e> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" vim-multiple-cursors
""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


""""""""""""""""""""""""""""""
" vim airline
""""""""""""""""""""""""""""""
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_powerline_fonts = 1
let g:airline_theme="simple"
" let g:airline_theme="base16_airship"

" Automatically truncate sections
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 100,
  \ 'x': 100,
  \ 'y': 105,
  \ 'z': 50,
  \ 'warning': 50,
  \ }


""""""""""""""""""""""""""""""
" vim-easymotion
""""""""""""""""""""""""""""""
map s <Plug>(easymotion-s)
" map <leader>ss <Plug>(easymotion-s2)

" match lower & upper case
let g:EasyMotion_smartcase = 1

let g:EasyMotion_use_smartsign_us = 1

map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion


""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""
" map <leader>gg :GitGutterToggle<CR>
map <leader>gs :Gstatus<CR>
map <leader>GS :vertical Gstatus<CR>
map <leader>gl :Glog<CR>
map <leader>ga :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gps :Gpush<CR>
map <leader>gd :Gdiff<CR>
map <leader>GD :vertical Gdiff<CR>
" set diffopt+=vertical
set diffopt=vertical

""""""""""""""""""""""""""""""
" vim-instant-markdown
""""""""""""""""""""""""""""""
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0


""""""""""""""""""""""""""""""
" vim markdown
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1


""""""""""""""""""""""""""""""
" undotree
""""""""""""""""""""""""""""""
map <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 35
let g:undotree_SetFocusWhenToggle = 1

if has("persistent_undo")
  set undodir='~/.undodir/'
  set undofile
endif


""""""""""""""""""""""""""""""
" ZoomWin
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>z :ZoomWin<cr>

""""""""""""""""""""""""""""""
" CtrlSF
""""""""""""""""""""""""""""""
" Prompt CtrlSF using ALT+f
" nmap ƒ <Plug>CtrlSFPrompt
" vmap ƒ <Plug>CtrlSFVwordPath
" nmap <silent> <leader>T <Plug>CtrlSFPrompt
nmap <leader>T <Plug>CtrlSFPrompt

" Toggle CtrlSF result display
" map † :CtrlSFToggle<CR>
" map <silent> <leader>t :CtrlSFToggle<CR>
map <leader>t :CtrlSFToggle<CR>

map ƒ <Plug>CtrlSFCwordPath<CR>

let g:ctrlsf_indent = 2
let g:ctrlsf_auto_focus = {
    \ "at" : "start"
    \ }
let g:ctrlsf_extra_backend_args = {
    \ 'ag': '--path-to-ignore ~/.ignore'
    \ }

""""""""""""""""""""""""""""""
" HardTime
""""""""""""""""""""""""""""""
" let g:hardtime_default_on = 0
" let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" let g:list_of_visual_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" " <UP> <DOWN> for autocomplete
" let g:list_of_insert_keys = ["<LEFT>", "<RIGHT>"]
" let g:list_of_disabled_keys = []
" let g:hardtime_showmsg = 1
" " let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
" let g:hardtime_ignore_quickfix = 1
" let g:hardtime_allow_different_key = 1

