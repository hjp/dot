set ai
" Disable (ab)use of X11 selection
set clipboard=
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n:\|
set expandtab
set exrc
set list
set listchars=tab:»·,trail:·
set modeline
set nojoinspaces
set nrformats-=octal
set nrformats+=hex
set nu
set printoptions=paper:A4,formfeed:y,portrait:n,number:y,left:10mm,right:10mm
set ruler
set scrolloff=5
set secure
set sm
set sw=4
set tw=72
set viminfo='100,<50,s10,h,%

if has('reltime')
  set incsearch
endif

if $BG == "light"
    set bg=light
    colorscheme hjp
    syntax on
elseif $BG == "dark"
    set bg=dark
    syntax on
endif

map <F7> :cp
map <F8> :cn
map!  >I<yypa/O
autocmd FileType perl let perl_fold=1
autocmd FileType perl syntax on

autocmd FileType go set sw=8
autocmd FileType go set tw=79
autocmd FileType go set noexpandtab

autocmd BufRead,BufNewFile *.ts set filetype=javascript
autocmd FileType javascript set sw=2

autocmd FileType html set sw=2

autocmd FileType crontab set tw=0
