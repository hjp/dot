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
set nrformats=hex
set nu
set printoptions=paper:A4,formfeed:y,portrait:n,number:y,left:10mm,right:10mm
set ruler
set secure
set sm
set sw=4
set tw=72
set viminfo='100,<50,s10,h,%
colorscheme hjp
syntax on
map <F7> :cp
map <F8> :cn
map!  >I<yypa/O
autocmd FileType perl let perl_fold=1
autocmd FileType perl let perl_fold_blocks=1
autocmd FileType perl syntax on
