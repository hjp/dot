" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=8 sw=4
" Vim color file
" (adapted from zellner.vim)
" Maintainer:	Peter J. Holzer
" Last Change:	2009-08-14

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "hjp"

hi Comment    term=bold                      ctermfg=88        ctermbg=White                  guifg=Red
hi Constant   term=underline                 ctermfg=90                                       guifg=Magenta
hi Error      term=reverse                   ctermfg=15        ctermbg=9                      guifg=White    guibg=Red 
hi Identifier term=underline                 ctermfg=22        ctermbg=NONE                   guifg=Blue
hi LineNr     term=bold      cterm=NONE      ctermfg=Gray      ctermbg=Blue     gui=NONE      guifg=DarkGrey guibg=NONE
hi Underlined term=underline cterm=underline ctermfg=163                        gui=underline guifg=SlateBlue
hi MatchParen                                                  ctermbg=yellow
hi Normal                                                                                     guifg=black guibg=white
hi PreProc    term=underline                 ctermfg=Magenta   ctermbg=253                    guifg=Purple
hi Search     term=reverse   cterm=NONE      ctermfg=White     ctermbg=Cyan     gui=NONE      guifg=Black guibg=Cyan
hi Special    term=bold                      ctermfg=53        ctermbg=NONE                   guifg=Magenta
hi Statement  term=bold                      ctermfg=DarkBlue                                 gui=NONE guifg=Brown

" Use color 226 (pale yellow) instead of the default yellow, because I refined
" the default yellow to orange for better contrast against a light background
" (there are way too many command line tools that assume a black background and
" hilight stuff in yellow).
hi StatusLine term=bold,reverse cterm=NONE ctermfg=226 ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray

hi String     term=bold                    ctermfg=90     ctermbg=NONE              guifg=Magenta
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi Type term=underline ctermfg=Blue gui=NONE guifg=Blue
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=Black guibg=Yellow
hi Title               ctermfg=black
hi link Boolean	Constant
hi link Character	Constant
hi link Conditional	Statement
hi link Debug		Special
hi link Define	PreProc
hi link Delimiter	Special
hi link Exception	Statement
hi link Float		Number
hi link Function	Identifier
hi link Include	PreProc
hi link Keyword	Statement
hi link Label		Statement
hi link Macro		PreProc
hi link Number	Constant
hi link Operator	Statement
hi link PreCondit	PreProc
hi link Repeat	Statement
hi link SpecialChar	Special
hi link SpecialComment Special
hi link StorageClass	Type
hi link String	Constant
hi link Structure	Type
hi link Typedef	Type
hi! link ErrorMsg Visual
hi! link MoreMsg Comment
hi! link Question Comment
hi! link WarningMsg ErrorMsg
