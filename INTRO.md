# Intro to Vim & Tmux

## Setup

- record session 
- go through vim & tmux setup
  - clone repo, branch: "qwerty"
  - `git clone --branch qwerty https://github.com/theRemix/Dot-OSX.git`
  - create your own dotfiles dir!
  - Tmux
    - install tmux
    - link tmux config
    - setup plugins
  - LunarVim
    - install lunarvim
    - link lunarvim config dir
    - do lunarvim post install
    - launch lunarvim and install plugins

## Walkthrough & Config Tour

### Tmux

[Cheatsheet !](https://tmuxcheatsheet.com/)

- launching tmux
  - creating tmux sessions
- prefix (C-A)
  - `:` enter command mode
- creating windows
  - `<prefix>c` create new window
- creating panes
  - `<prefix>|` split vertically, new pane to the left
  - `<prefix>-` split horizontally, new pane to the bottom
- navigating
  - windows
    - `<prefix>number`
  - panes
    - `C-<direction>` where direction is h,j,k,l
- resizing panes
  - `<prefix>S-<direction>` where direction is h,j,k,l
  - or just 
- detaching
- attaching
  - shared and remote
- managing sessions
  - `<prefix> s` let go fo control key
- saving sessions
  - `<prefix>s` hold Control key down, Ctrl-a,s
- restoring sessions
  - `<prefix>r` hold Control key down, Ctrl-a,r
- yank (copy and paste)
- zoom
  - `<prefix>z` toggle zoom of current pane
- configuration file

### Vim

Vanilla Vim (Vimnilla?)

- vocabulary
  - `C-` hold Control key and press a key
- modes
  - Normal
    - `esc` to return to this mode
    - `:` Command, enter vim command mode from Normal
  - Insert
    - `i` enter insert mode
    - `I` prepend, move cursor to beginning of line then enter insert mode
    - `a` append, moves one char forward then enters insert mode
    - `A` append, moves to end of line then enters insert mode
    - `o` new line below, begin new line below cursor then enters insert mode
    - `O` new line abov, begin new line above cursor then enters insert mode
    - `esc` to return to Normal mode
  - Visual
    - `v` start visual selection characters
    - `V` start visual selection of lines
    - `C-v` start vertical block selection
    - `esc` cancel selection and return to Normal mode
- help docs
  - `:help <topic>`
  - `:help <key>`
- fs
  - `:q` quitting vim
  - `:w` saving file
  - `:w <path>` saving file to <path>
  - `:wq` saving and quit
  - `:q` quit and discard any changes
  - `:e <path>` open file by entering <path>
  - `:e` reload current file
  - `:e!` reload current file discarding any changes
- buffers
  - `:bd` close current buffer
  - `:bn` next buffer
  - `:bp` previous buffer
- clipboard
  - `y` yank (copy selection)
    - `y[count]<navigation>` yank [count] lines or characters
  - `yy` yank current line
  - `p` put (paste)
  - `d` delete selection and copies to clipboard
  - `dd` delete current line and copies to clipboard
- navigating
  - hjkl -> left, down, up, right
  - `gg` go to beginning of document
  - `G` go to end of document
  - `$` go to end of line
  - `^` go to beginning of line
  - `C-d` move cursor half page down
  - `C-u` move cursor half page up
  - `e` go to end of word or next word
  - `b` go to beginning of word or previous word
  - `w` go to beginning of next word
- [count]
  - `[count]<whatever action>` do something [count] times
- undo
  - `u` undo
  - `C-r` redo
- repeating last action
  - `.`
- text manipulation
  - with selection
    - `u` lowercase
    - `U` uppercase
    - `c` delete and enter insert mode
    - `r` replace with next typed character
- search
  - `/` start new search
  - `N` go to next result
  - `n` go to previous result
  - `#` select current word and search it
  - with selection
    - `#` search current buffer for selected characters
- find and replace
  - `:s/find/replace/` find and replace one
  - `:s/find/replace/g` find and replace all
- macros
  - `q<index>` enter macro recording mode, then hit escape to stop recording
  - `@<index>` play macro at <index>
- register
  - `"` view register
  - `"<index>` select register [a-z]
    - visually select, then press `"<index>` then yank or put

### LunarVim

- vocabulary
  - `<Leader>` start key mapped command sequence
  - `<Tab>` tab key
  - `S-` shifted key
- panes
  - navigation
    - `C-<direction>` where <direction> is h,j,k,l
    - this works just like tmux
  - `:vs` create vertical split
  - `:split` create horizontal split
  - `<Leader>q` close current pane
- fs and Telescope
  - `<Leader>w` Save (write file)
  - `<Leader>e` toggle file Explorer
  - `<Leader>f` quick search for files
  - `<Leader>sf` search for files with preview
- file explorer
  - `v` open file under cursor in a new vertical split pane
- buffers
  - `<Leader>c` close current buffer
  - `<Tab>` go to next buffer (same as :bn)
  - `S-<Tab>` go to previous buffer (same as :bp)
  - `<Leader>bf` search for buffers
  - `<Leader>b` see WhichKey `Buffers+` for more
- navigating with EasyMotion
  - `<Leader>[h,j,k,l]` jump vertically or horizontally
  - `s` search for one character then jump
  - `ss` search for two characters then jump
- undotree
  - `<Leader>u`
- search and Telescope 
  - `<Leader>st` search for text
  - `<Leader>s` see WhichKey `Search+` for more
- custom key maps
  - `jk` from insert mode, enters Escape key
  - `M-j` `M-k` alt+j or alt+k moves text up and down
- vim-surround
  - `S-s <character>` with selection, wrap with <character>
- tour config structure
- copilot
