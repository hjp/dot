set ai
" Disable (ab)use of X11 selection
set clipboard=
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n:\|
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
    colorscheme default
    syntax on
endif

map <F7> :cp
map <F8> :cn
map!  >I<yypa/O
autocmd FileType perl let perl_fold=1
autocmd FileType perl let perl_fold_blocks=1
autocmd FileType perl syntax on
