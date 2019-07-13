set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdTree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" better cooperation with tmux
Plugin 'christoomey/vim-tmux-navigator'

" gutter for marks
Plugin 'kshenoy/vim-signature'

Plugin 'rhysd/vim-clang-format'
Plugin 'sbdchd/neoformat'

" session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'gikmx/ctrlp-obsession'

Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'joereynolds/gtags-scope'

" :Search :SearchBuffers :SearchReset :SearchBuffersReset
Plugin 'vim-scripts/MultipleSearch'

" ga / gaip= align in paragraph around char =
Plugin 'junegunn/vim-easy-align'

" :ColorToggle
Plugin 'lilydjwg/colorizer'

" Syntaxes for a lot of languages
Plugin 'sheerun/vim-polyglot'

" :DevDocs ---
Plugin 'rhysd/devdocs.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'kracejic/themeinabox.vim'

let g:colorizer_startup = 0
call vundle#end()

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on

"General
set number  	"Show line numbers
set relativenumber
nmap <leader>num :set nu! <CR>:set rnu!<CR>
set wrap  		" enable wraping
set linebreak   	" Break lines at word (requires Wrap lines)
set nolist      	" list disables linebreak
set scrolloff=5 	" 2 lines above/below cursor when scrolling
set noswapfile  	" turn off swapfiles
set textwidth=0
set wrapmargin=0    	" Disable line wrap
set ruler   	    	" Show row and column ruler information
set showbreak=+++   	" Wrap-broken line prefix
set showmatch   	" Highlight matching brace
set showcmd             " show command in bottom bar
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set visualbell  	" Use visual bell (no beeping)
set cursorline          " highlight current line
set matchpairs+=<:>     " specially for html
set hlsearch    	" Highlight all search results
set smartcase   	" Enable smart-case search
set ignorecase  	" Always case-insensitive
set incsearch   	" Searches for strings incrementally

nmap \q :nohlsearch<CR>
nnoremap <leader><space> :noh<cr>

set virtualedit=onemore " allow to go one character behind the end of the line
set autoindent  	" Auto-indent new lines
set expandtab   	" Use spaces instead of tabs
set shiftwidth=4    	" Number of auto-indent spaces
set smartindent 	" Enable smart-indent
set smarttab    	" Enable smart-tabs
set softtabstop=4   	" Number of spaces per Tab
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=150         " keep 150 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
set previewheight=7

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   	" This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

" Tagbar
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F5> :TagbarOpenAutoClose<CR>
let g:tagbar_case_insensitive = 1
let g:tagbar_indent = 1
let g:tagbar_map_showproto = "r"
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_sort = 0

" for pasting in terminal
set pastetoggle=<F2>

nnoremap <leader>a <C-A>
vnoremap <silent> <Plug><leader>a :<C-U>call <SID>doincrement(v:count1)<CR>

" increment numbers
noremap + <c-a>
noremap - <c-x>

" Splits
set splitbelow    " more natural split opening
set splitright    " more natural split opening

"split movement
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

"saner splits
nnoremap <C-w>\| <C-w>v
nnoremap <C-w>_ <C-w>s

"resizing splits
nnoremap <C-w><C-w>h 8<C-w><
nnoremap <C-w><C-w>l 8<C-w>>
nnoremap <C-w><C-w>k 8<C-w>-
nnoremap <C-w><C-w>j 8<C-w>+
nnoremap <C-w><C-w><C-w>h <C-w><
nnoremap <C-w><C-w><C-w>l <C-w>>
nnoremap <C-w><C-w><C-w>k <C-w>-
nnoremap <C-w><C-w><C-w>j <C-w>+

" buffers
nmap \] :bnext<CR>
nmap \[ :bprev<CR>
nmap <leader>w :bd<CR>
command! Bda :bufdo bd
nnoremap <bs> <c-^>
command! Bd bp|bd<space>#
nnoremap <leader>W :Bd<CR>

syntax on           " enable syntax processing

" settings for kshenoy/vim-signature, it will color the marks with gitgutter
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

"reload vimrc
:nmap \rv :source $MYVIMRC<CR>

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set spellfile=~/.vim/spell.misc.utf-8.add
command! Spellen :setlocal spell spelllang=en_us
command! Spellcs :setlocal spell spelllang=cs
command! Spellnone :setlocal nospell

" quickfix next, prev
:nmap [q :cprev<CR>
:nmap ]q :cnext<CR>
:nmap [Q :cfirst<CR>
:nmap ]Q :clast<CR>

" Theme stuff
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
nnoremap <leader>1 :colorscheme railscasts<cr>:AirlineTheme dark<cr>
nnoremap <leader>2 :colorscheme molokai<cr>:AirlineTheme base16_monokai<cr>
nnoremap <leader>3 :colorscheme themeinabox<cr>:AirlineTheme base16_eighties<cr>
nnoremap <leader>4 :colorscheme themeinabox-light<cr>:AirlineTheme sol<cr>
nnoremap <leader>5 :colorscheme themeinabox-transparent<cr>:AirlineTheme base16_eighties<cr>

" get current syntax class
nmap <leader>sy :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" CLANG FORMAT
" default settings
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
      \ "AllowShortFunctionsOnASingleLine": "Empty",
      \ "AlwaysBreakTemplateDeclarations": "true",
      \ "BreakBeforeBraces": "Allman",
      \ "BreakConstructorInitializersBeforeComma": "true",
      \ "IndentCaseLabels": "true",
      \ "IndentWidth":     4,
      \ "MaxEmptyLinesToKeep": 2,
      \ "NamespaceIndentation": "Inner",
      \ "ObjCBlockIndentWidth": 4,
      \ "TabWidth": 4}

augroup ClangFormatSettings
    autocmd!
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc,java,javascript map <buffer><Leader>c <Plug>(operator-clang-format)
    autocmd FileType c,cpp syntax clear cppSTLconstant

    autocmd FileType vimwiki nmap <leader>tts :TaskWikiMod +sprint<CR>
    autocmd FileType vimwiki nmap <leader>ttS :TaskWikiMod -sprint<CR>
augroup END

" Neoformat
let g:neoformat_enabled_python = ['autopep8']

nnoremap <Leader>cf :Neoformat<CR>
vnoremap <Leader>cf :Neoformat<CR>
" format line +-1
autocmd FileType c,cpp,objc,java,javascript nnoremap <Leader>cc :.-1,.+1Neoformat<CR>

augroup filetypedetect
    au BufRead,BufNewFile *.log set filetype=log
    au BufReadPost,BufNewFile *.compositor set ft=compositor
    au BufReadPost,BufNewFile *.material set ft=material
    au BufReadPost,BufNewFile *.glsl,*.cg set ft=glsl
    au BufReadPost,BufNewFile content.txt set ft=fitnesse
    au BufReadPost,BufNewFile database.txt,*.conf set ft=conf
    au BufReadPost,BufNewFile config.in set ft=kconfig
    au BufReadPost,BufNewFile *.xml set tabstop=4
    au BufReadPost,BufNewFile *.crt set ft=crt
augroup END

:nmap \e :NERDTreeToggle<CR>

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
nnoremap z<space> zA
set foldmethod=indent   " fold based on indent level

"Advanced
set undolevels=1000 	" Number of undo levels

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

set tabpagemax=50 	" max number of pages

colorscheme themeinabox
let g:airline_theme='base16_eighties'

"plugins
set runtimepath^=~/.nvim/bundle/ctrlp.vim

"   YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_error_symbol = '%'
let g:ycm_warning_symbol = '%'
nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ys :YcmDiags<CR>
nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>yR :YcmRestartServer<CR>
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
nnoremap <F9> :YcmCompleter GetDocImprecise<CR>

" airline
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ ''   : 'S'
  \ }
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 79,
  \ 'x': 60,
  \ 'y': 88,
  \ 'z': 60,
  \ 'warning': 80,
  \ 'error': 80,
  \ }
let w:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z='☰ %l/%L:%c'
let g:airline#extensions#branch#format = 2

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" tabline
command! TablineON :set showtabline=1
command! TablineOFF :set showtabline=0

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
