" ~/.vimrc
"---------

if version >= 700

  " *** ENVIRONMENT ************************************************
  "{{{

  " reset all options to compiled in defaults
  set all&

  " Mode no compatible with old vi
  set nocompatible

  " Minimal number of lines above/below cursor
  set scrolloff=3

  " Syntax Coloring
  syntax on

  " Highlight any strings found matching the search pattern
  set hlsearch

  " Incremental searches
  set incsearch

  " Line numbering
  set number

  " Round indent to a multiple of 'shiftwidth'
  set shiftround

  " Turn all tabs into space
  set expandtab

  " The number of space characters that will be inserted when the tab key is pressed
  set tabstop=2
  set softtabstop=2

  " A <Tab> in an indent inserts 'shiftwidth' spaces
  set smarttab

  " The number of space characters inserted for indentation
  set shiftwidth=2

  " Auto Indentation
  set autoindent

  " Write files when needed
  set autowrite

  " Try to detect file formats. Unix for new files and autodetect for the rest.
  set fileformats=unix,dos,mac

  " end-of-line format: unix - not dos
  set fileformat=unix

  " Last line in the file has an end-of-line
  set endofline

  " Long lines wrap
  set wrap

  " Create backup files.
  set backup

  " Group backup files on this directories
  set backupdir=$HOME/.vim/backup,/tmp,.

  " Group swap files on this directories
  set directory=$HOME/.vim/swap,/tmp,.

  " UTF-8
  set encoding=utf-8
  try
      lang en_US
  catch
  endtry

  set fileencoding=utf-8
  set termencoding=utf-8

  " Any command that displays more than a screen full of data pauses with a "More" prompt
  set more

  " Attempt to determine the type of a file based on its name and possibly its
  " contents.  Use this to allow intelligent auto-indenting for each filetype,
  " and for plugins that are filetype specific.
  filetype indent plugin on

  " One of the most important options to activate. Allows you to switch from an
  " unsaved buffer without saving it first. Also allows you to keep an undo
  " history for multiple files. Vim will complain if you try to quit without
  " saving, and swap files will keep you safe if your computer crashes.
  set hidden

  " Use case insensitive search, except when using capital letters
  set ignorecase

  " Override 'ignorecase' when pattern has upper case characters
  set smartcase

  " Allow backspacing over autoindent, line breaks and start of insert action
  set backspace=indent,eol,start

  " Instead of failing a command because of unsaved changes, instead raise a
  " dialogue asking if you wish to save changed files.
  set confirm

  " Number of command in history
  set history=1000

  " Specify the character typed before data is saved in the swap file.
  set updatecount=500

  " Specify the amount of time (in milliseconds) to wait after typing stops before writing the data to the swap file.
  set updatetime=10000

  " Show the cursor position all the time
  set ruler

  " Display incomplete commands
  set showcmd

  " Display the current mode in the status line
  set showmode

  " terminal connection is fast
  set ttyfast

  " Binary file editing
  set nobinary

  " Show list instead of just completing
  set wildmenu

  " Expand the command line using tab
  set wildchar=<Tab>

  " Ignore at auto-completion:
  set wildignore=*.o,*.obj,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.mp[23g],*.jar,*.rar,*.zip,*.gz,*.tgz,*.jpg,*.png,*.gif,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.ps,*.dvi,desktop.ini,*/CVS/,*/.hg/,*.~*,*~,.git

  " Suffixes that get lower priority when doing tab completion for filenames.

  " Ring the bell for error messages
  set noerrorbells

  " Use a visual bell instead of beeping
  set visualbell

  " Disable beeping and visual bell
  autocmd VimEnter * set vb t_vb=""
  autocmd GUIEnter * set vb t_vb=""
  set vb t_vb=""

  " Many jump commands move the cursor to the first non-blank character of a line
  set startofline

  " Enable using settings from modelines when reading a file
  set modeline

  " How selecting text behaves
  set selection=inclusive

  " Always put selected text on the clipboard
  set clipboard=unnamed
  let g:clipbrdDefaultReg='+'

  " Maximum number of changes that can be undone
  set undolevels=1000

  " No force sync journal filesystem in disk after write
  set nofsync

  " Make sure the swap is synced every time we write to it - uses sync() instead
  " of the default fsync() - any non empty value enables this feature
  set swapsync=sync

  " Don't automatic change the CWD
  set noautochdir

  " Automatically read a file when it was modified outside of Vim
  set autoread

  " Make textwidth infinite
  set textwidth=0

  " Do not redraw the screen while macros are running.
  set lazyredraw

  " None of these should be word dividers, so make them not be
  set isk+=_,$,@,%,#,-,?,%,&

  " enable reading .vimrc/.exrc/.gvimrc in the current directory
  set exrc

  " Use shifted cursor keys to start/stop selection
  "set keymodel=startsel,stopsel

  " use '/' for path delimiter in Windows
  set shellslash

  " command line two lines high
  set cmdheight=2

  " show matching bracket
  set showmatch

  " show matching brackets for 0.5 seconds
  set matchtime=5

  " magic patterns in searches
  set magic

  " Put vim in secure mode, disabling autocmd, shell, and write commands that
  " are in .vimrc, .exrc, and .gvimrc files in the local directory
  set secure

  " line numbers
  set number nuw=3

  " don't use dos-style filenames
  set noshortname

  " Show tab characters and trailing whitespace
  set nolist

  " use markers for folding
  set foldmethod=marker

  " Open all folds by default
  set foldlevel=0

  " These commands open folds
  " set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
  set foldopen=search

  " minimum number of screen lines for a fold to be closed
  set foldminlines=1

  " Use the 'global' flag by default in search/replace
  set gdefault

  " When using make, where should it dump the file
  set makeef=error.err

  " Function keys that start with an <Esc> are recognized in Insert mode.
  set esckeys

  " Split windows below current window.
  set splitbelow

  " Don't append bloody carriage returns.
  set notextmode

  " Show an error window when there are errors
  " cwindow

  " do lots of scanning on tab completion
  "set complete=.,w,b,u,U,t,i,d

  " I usually complete variables, functions etc...
  " set noinfercase

  " Ignore whitespace in diff
  set diffopt+=iwhite

  " Accept  a space (ASCII 32) as a valid character for a file name
  set isfname+=32

  " Virtual Spaces
  set virtualedit=all

  " Always report changes
  " set report=0

  " No extra space when join lines
  set nojoinspaces

  " Make File-Open track directory of current file
  " set browsedir=buffer

  "}}}

  " *** MOUSE ******************************************************
  "{{{

  " In many terminal emulators the mouse works just fine, thus enable it.
  if has('mouse')
    set mouse=a

    " Hide the mouse pointer while typing
    set mousehide

    " Maximum time in msec to recognize a double-click
    set mousetime=500

    " Sets the model to use for the mouse
    set mousemodel=extend

  endif

  "}}}

  " *** GUI OPTIONS ************************************************
  "{{{

  if has("gui_running")

    " Show vertical line to wrap the line
    set colorcolumn=80

    " Sets the option 'background' to light or dark.
    set background=dark

    " Config scheme
    "colorscheme evening
    colorscheme desert

    " Set cursor line
    set cursorline

    " Font used in GUI
    set guifont=Monospace\ 13

    " Default size of window
    autocmd GUIEnter * set lines=35 columns=120

    " Hide icon toolbar
    set guioptions=-m

    " Show icon in taskbar
    set guioptions+=i

    " Windows can be 0 line high
    set winminheight=0

    " Use console dialog rather than popup dialog
    set guioptions+=c

    "Set terminal title to filename
    set title

    " Title String
    set titlestring=%<\%F%=%l\ /\ %L\ \ \[\ %P\ \]

    " Gives the percentage of 'columns' to use for the length of the window title.
    set titlelen=70

    set laststatus=2
  else

    " Sets the option 'background' to light or dark.
    set background=dark

    " Config scheme
    "colorscheme ron
    colorscheme torte

    " Unset cursor line in console
    set nocursorline

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

  endif

  "}}}

  " *** SYNTAX HIGHLIGHTING ****************************************
  "{{{
  "
  " Display SCons files with Python syntax
  autocmd BufReadPre,BufNewFile SConstruct set filetype=python
  autocmd BufReadPre,BufNewFile SConscript set filetype=python

  " Display Waf files with Python syntax
  autocmd BufReadPre,BufNewFile wscript set filetype=python

  " Highlight unwanted spaces
  highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/

  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/

  "Make The Omni-Complete (CTRL+N) Menu More Readable
  highlight Pmenu      gui=bold guibg=brown
  highlight PMenuSel   gui=bold guibg=blue
  highlight PMenuSbar  gui=bold guibg=darkgreen
  highlight PMenuThumb gui=bold guibg=green

  " highlight StatusLine gui=bold guibg=white guifg=red
  highlight StatusLine gui=bold guifg=darkgray
  autocmd InsertEnter * highlight StatusLine gui=bold guifg=red
  autocmd InsertLeave * highlight StatusLine gui=bold guifg=darkgray

  "}}}

  " *** PLUGINS ****************************************************
  "{{{
  """""""""""""""""""""""""""
  """ http://www.vim.org/ """
  """""""""""""""""""""""""""
  "
  " Align
  " Alternate Files quickly
  " NERD tree
  " QuickBuf
  " SuperTab

    " Library Viewer
    " ZoomWin
    " Zip Handler
    " WhereFrom
    " Gnu Debugger Manager for Vim
    " FlistTree
    " Stubs
    " AutoAlign suite
    " Ctags Explorer

  " Load plugin scripts when starting up
  set loadplugins

  " NERDTree Plugin
  cab tree NERDTree
  map <F3> <ESC>:NERDTreeToggle<CR>
  let NERDTreeChDirMode=0
  let NERDTreeWinPos='left'
  let NERDTreeQuitOnOpen=0
  let NERDTreeMouseMode=2

  " QuickBuf
  let g:qb_hotkey = "<F2>"

  " Alternate Files quickly
  let g:alternateSearchPath      = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../headers'
  let g:alternateExtensions_h    = "c,cpp,cxx,cc,CC"
  let g:alternateExtensions_H    = "C,CPP,CXX,CC"
  let g:alternateExtensions_cpp  = "h,hpp"
  let g:alternateExtensions_CPP  = "H,HPP"
  let g:alternateExtensions_c    = "h"
  let g:alternateExtensions_C    = "H"
  let g:alternateExtensions_cxx  = "h"

  " Taglist
  let Tlist_Exist_OnlyWindow=1
  map <F4> <ESC>:TlistToggle<CR>
  let Tlist_Use_Right_Window = 1
  let Tlist_WinWidth = 50

  " OmniCppComplete
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  set completeopt=menu,menuone

  let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
  let OmniCpp_GlobalScopeSearch = 1
  let OmniCpp_ShowAccess = 1
  let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
  let OmniCpp_MayCompleteDot = 1 " autocomplete with .
  let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
  let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
  let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
  let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
  "}}}

  " *** FUNCTIONS **************************************************
  "{{{

  " Automatically create tmp or backup directories
  function! InitBackupDirs()
    if has('win32') || has('win32unix') "windows/cygwin
      let separator = "_"
    else
      let separator = "."
    endif

    let parent_dir = $HOME .'/' . separator . 'vim/'
    let backup_dir = parent_dir . 'backup/'
    let swap_dir   = parent_dir . 'swap/'
    let tags_dir   = parent_dir . 'tags/'

    if exists("*mkdir")
      if !isdirectory(parent_dir)
        call mkdir(parent_dir)
      endif

      if !isdirectory(backup_dir)
        call mkdir(backup_dir)
      endif

      if !isdirectory(swap_dir)
        call mkdir(swap_dir)
      endif

      if !isdirectory(tags_dir)
        call mkdir(tags_dir)
      endif
    endif
  endfunction

  " Append modeline after last line in buffer.
  function! AppendModeline()
    let save_cursor = getpos('.')
    let append = ' vim: set tw='.&textwidth.' ts='.&tabstop.' sw='.&shiftwidth.' ft='.&filetype.' : '
    $put =substitute(&commentstring, '%s', append, '')
    call setpos('.', save_cursor)
  endfunction

  function! StripTrailingWhitespace()
    call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  endfunction

  function! CompleteTab(direction)
    let prec = strpart( getline('.'), 0, col('.')-1 )
    if prec =~ '^\s*$'
      if "backward" == a:direction
        return "\<bs>"
      else
        return "\<tab>"
      endif
    endif

    if exists('&omnifunc') && &omnifunc == 'omni#cpp#complete#Main' && prec =~ '[\.>]\s*[~]\?[a-zA-Z_]*[(]\?$'
      " Class completion... use normal direction
      " Use this with omniCompletion
      if "backward" == a:direction
        return "\<c-p>"
      else
        return "\<c-n>"
      endif
    endif

    " else use generic completion: last-seen / reverse-order
    if "backward" == a:direction
      return "\<c-n>"
    else
      return "\<c-p>"
    endif
  endfunction
  "}}}

  " *** AUTOCOMMANDS ***********************************************
  "{{{

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

  " Make views automatic
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview

  autocmd FileType c,cpp    setlocal foldmethod=marker
  autocmd BufWinEnter *.c   setlocal foldmethod=marker
  autocmd BufWinEnter *.cpp setlocal foldmethod=marker
  autocmd BufWinEnter *.h   setlocal foldmethod=marker

  autocmd BufWinEnter * set noinsertmode

  " Disable auto-comment
  autocmd FileType c,cpp    setlocal comments-=:// comments+=f://
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  autocmd BufWinLeave * call clearmatches()

  autocmd FileWritePre * :call StripTrailingWhitespace()
  autocmd FileAppendPre * :call StripTrailingWhitespace()
  autocmd FilterWritePre * :call StripTrailingWhitespace()
  autocmd BufWritePre * :call StripTrailingWhitespace()

  autocmd VimEnter * :call InitBackupDirs()
  "}}}

  " *** SHORTCUTS **************************************************
  "{{{

  " CTRL-A is Select all
  noremap  <C-a> gggH<C-O>G
  inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
  cnoremap <C-a> <C-C>gggH<C-O>G
  onoremap <C-a> <C-C>gggH<C-O>G
  snoremap <C-a> <C-C>gggH<C-O>G
  xnoremap <C-a> <C-C>ggVG

  " CTRL-Tab is Next window
  noremap <C-Tab> <C-W>w
  inoremap <C-Tab> <C-O><C-W>w
  cnoremap <C-Tab> <C-C><C-W>w
  onoremap <C-Tab> <C-C><C-W>w

  " CTRL-Shift-Tab is Previous window
  noremap <C-S-Tab> <C-W>W
  inoremap <C-S-Tab> <C-O><C-W>W
  cnoremap <C-S-Tab> <C-C><C-W>W
  onoremap <C-S-Tab> <C-C><C-W>W

  " control buffers
  map <C-c> <ESC>:bdelete<CR>
  map <C-left> <ESC>:bprev<CR>
  map <C-right> <ESC>:bnext<CR>

  " x deletes, but does not update buffer
  nnoremap x "_x
  vnoremap x "_x

  " d deletes, but does not update buffer
  nnoremap d "_d
  vnoremap d "_d

  " D deletes, but does not update buffer
  noremap D "_D
  vnoremap D "_D

  " Y yanks from cursor to $
  nnoremap Y y$
  vnoremap Y y$

  "Move a line of text using ALT+up and ALT+down
  nmap <M-down> mz:m+<cr>`z
  nmap <M-up> mz:m-2<cr>`z

  " CTRL-F4 is Close window
  noremap <C-F4> <C-W>c
  inoremap <C-F4> <C-O><C-W>c
  cnoremap <C-F4> <C-C><C-W>c
  onoremap <C-F4> <C-C><C-W>c

  " fold Control
  map zz zA
  nnoremap <space> zO
  map <C-up>  zk
  map <C-down> zj

  " save
  map <C-s> :wa<CR>
  imap <C-s> <ESC>:wa<CR>li

  " Search
  map  <C-f> <ESC>/
  imap <C-f> <ESC>/

  " Use CTRL-Q to do what CTRL-V used to do
  noremap <C-Q>		<C-V>

  " backspace in Visual mode deletes selection
  vnoremap <BS> d

  """revcw"""""""""""""""""""""""""""""""""""""""""""""""""""""22

  " Misspell Fixes
  cabbrev a A
  cabbrev W w
  cabbrev WQ wq
  cabbrev wQ wq
  cabbrev Wq wq
  cabbrev Q q
  cabbrev Q1 q!
  cabbrev q1 q!
  cabbrev Wa wa
  cabbrev WA wa
  cabbrev wA wa

  map  <F5>     <ESC>:make<CR>
  map  <C-F5>   <ESC>:clist<CR>
  map  <F6>     <ESC>:copen<CR>
  map  <C-F6>   <ESC>:cclose<CR>
  map  <F7>     <ESC>:cnext<CR>
  map  <C-F7>   <ESC>:cprev<CR>

  map <C-l> <ESC>:nohlsearch<CR>:call clearmatches()<CR>

  " Map leader
  let mapleader = "_"
  map <Leader>s <ESC>:call StripTrailingWhitespace()<CR>
  map <leader>w <ESC>:wa<cr>
  map <Leader>c <ESC>:cd %:h<CR>

  map <F1> <Esc>
  imap <F1> <C-x><C-o>
  "}}}

  " *** TESTING ****************************************************
  "{{{
    " Help menu
    amenu 9990.10.10 &personal.Vimrc.Edit\ ~\/\.vimrc :e ~/.vimrc<CR>
    amenu 9990.10.20 &personal.Vimrc.Reload\ ~\/\.vimrc :source ~/.vimrc<CR>
    amenu 9990.10.30 &personal.Vimrc.Edit\ \.\/\.vimrc :e ./.vimrc<CR>
    amenu 9990.10.40 &personal.Vimrc.Reload\ \.\/\.vimrc :source ~/.vimrc<CR>

    amenu 9990.20  &personal.Change\ to\ directory\ of\ the\ in-screen-file :cd %:h<CR>
    amenu 9990.30  &personal.Convert\ text\ files\ from\ DOS\ to\ UNIX :%s/\r//g<CR>
    amenu 9990.40  &personal.Converting\ tabs\ to\ spaces :retab<CR>
    amenu 9990.50  &personal.Delete\ all\ trailing\ whitespace	:%s/\s\+$//e<CR>
    amenu 9990.60  &personal.Source\ in-screen-file :source %<CR>

    amenu 9990.70  &personal.Show\ tabs\ and\ end\ of\ line\ characters :set list<CR>
    amenu 9990.80  &personal.Don't\ show\ tabs\ and\ end\ of\ line\ characters :set nolist<CR>
    amenu 9990.90  &personal.Changes\ file\ type\ to\ "read\ only" :set readonly<CR>
    amenu 9990.100  &personal.Open\ file\ under\ cursor <C-w>f<CR>

    "amenu 9990.55 &personal.-sep1-			       <Nop>

  "}}}

   " *** TAGS ******************************************************
  "{{{

    " tag file create by ctags
    set tags=~/.vim/tags/tags
    set tags+=./tags
    set tags+=./.tags

    " build tags of your own project with Ctrl-F12
    map <C-F12> <ESC>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    map <C-F11> <ESC>:!cscope -b<CR><ESC>:cs add cscope.out<CR>
    map <C-S-F12> <ESC>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tags/tags /usr/include /usr/local/include<CR>

    inoremap <tab> <c-r>=CompleteTab("forward")<cr>
    inoremap <s-tab> <c-r>=CompleteTab("backward")<cr>

    map gt g]
  "}}}

   " *** INTERESTING COMMANDS **************************************
  "{{{

    """ Deletes every line that contains string
    """ :g/string/d

    """ Deletes every line that does not contain string
    """ :v/string/d

    """ Remove all blank lines.
    """ :v/./d or :g/^$/d

    """ Removes all lines that only have whitespace.
    """ :g/^\s*$/d

    """ Replaces multiple blank lines with just one blank line.
    """ :v/./.,/./-1join

    """ Insert a pound sign (#) at the beginning of the line
    """ from the line marked with mx to the current line
    """ :'x,.s/^/#/

    """ Deletes spaces at the start of the line
    """ :%s/^ *//
    """ :'<,'>s/^ *//

  "}}}

endif
"***********************************************************
"End Of File
" vim: set tw=0 ts=2 sw=2 ft=vim :
