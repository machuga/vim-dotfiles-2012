set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set linespace=2
set scrolloff=5
set expandtab

set list listchars=tab:\ \ ,trail:·

set autoindent
set smartindent

set cpoptions+=$
set guioptions-=T

set virtualedit=block
set splitbelow

set guifont=Inconsolata-g\ for\ Powerline:h15

if &term != "xterm-color"
    if has("gui-running")
        let g:solarized_termcolors=256
        set t_Co=16
        set background=light
        colorscheme solarized
    else
        "let g:solarized_termcolors=256
        set t_Co=16
        set background=light
        colorscheme solarized

    endif
endif


" Don't list hiddens set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
highlight Search cterm=underline
"set cursorline
"highlight Cursorline cterm=underline

" Code folding
set foldenable
nnoremap <leader>ft Vatzf

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>


" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.smarty set filetype=smarty 

au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim') 
au Filetype smarty set complete+=k 

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 expandtab

" make Ruby use 2 spaces
au FileType ruby set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType coffee set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType slim set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType haml set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType erb set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType ujs set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79

" make PHP conform to Fuel standards
au FileType php set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 expandtab
au FileType blade set textwidth=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if has('mouse')
  set mouse=a
endif

if has("autocmd")
    autocmd FileType python set complete+=k/Users/machuga/.vim/pydiction-0.5/pydiction isk+=.,(
    autocmd bufwritepost .vimrc source ~/.vimrc
    autocmd bufwritepost .vimrc.local source ~/.vimrc
endif " has("autocmd"

nnoremap ,h <C-W>h
nnoremap ,j <C-W>j
nnoremap ,k <C-W>k
nnoremap ,l <C-W>l
nnoremap ,H <C-W>H
nnoremap ,J <C-W>J
nnoremap ,K <C-W>K
nnoremap ,L <C-W>L
nnoremap <Leader>] :noh <CR>
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>



" Command-T configuration
let g:CommandTMaxHeight=20

let g:Powerline_colorscheme = 'skwp'
let g:Powerline_symbols = 'fancy'

"NerdTREE
" nmap ,nt :NERDTree<CR>
" left NERDTreeShowHidden=1

" Use to clear out tests for screencasts
function! RunRspecTests(filename)
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :exec ":!rspec ".a:filename

    " :!php artisan test
endfunction

" Use to clear out tests for screencasts
function! RunPHPUnitTests()
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :exec ":!phpunit"
endfunction

map <Leader>r :call RunPHPUnitTests()<CR>
"map <Leader>r :call RunTests('%')<CR>
set shell=/bin/sh "Or whatever shell needs set

