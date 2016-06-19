" Author: jdevalerie <jdevalerie@gmail.com>
" Source: https://github.com/jdevalerie/jay
" Last Edit: June 18, 2016
" Description: Yet another colorscheme for Vim, great!

" Initial Setup:
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name="jay"

" Palette:
let s:back = ['#1f1f1f', 234]
let s:back2 = ['#000000', 235]
let s:fore = ['#dfdfdf', 253]

let s:neutral = {}
let s:neutral.red = ['#bf3f3f', 131]
let s:neutral.green = ['#3fbf3f', 71]
let s:neutral.yellow = ['#bfbf3f', 143]
let s:neutral.blue = ['#3f7fbf', 67]
let s:neutral.purple = ['#7f3fbf', 97]
let s:neutral.aqua = ['#3fbfbf', 73]
let s:neutral.orange = ['#bf7f3f', 137]

let s:bright = {}
let s:bright.red = ['#df5f5f', 167]
let s:bright.green = ['#5fdf5f', 77]
let s:bright.yellow = ['#dfdf5f', 185]
let s:bright.blue = ['#5f9fdf', 74]
let s:bright.purple = ['#9f5fdf', 134]
let s:bright.aqua = ['#5fdfdf', 80]
let s:bright.orange = ['#df9f5f', 179]

" Constants:
let s:none = ['NONE', 'NONE']
let s:bold = 'bold,'
let s:italic = 'italic'
let s:underline = 'underline,'

" Highlighting Function:
" TODO, Stolen from gruvbox's highlighting function
function! s:HF(group, fg, ...)
	" Foreground
	let fg = a:fg

	" Background
	if a:0 >= 1
		let bg = a:1
	else
		let bg = s:none
	endif

	" Emphasis
	if a:0 >= 2 && strlen(a:2)
		let emstr = a:2
	else
		let emstr = 'NONE,'
	endif

	" Combine Inputs TODO, think of better title
	let histring = ['hi', a:group,
				\ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
				\ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
				\ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
				\ ]

	" Special TODO, why special?
	if a:0 >= 3
		call add(histring, 'guisp=' . a:3[0])
	endif

	execute join(histring, ' ')
endfunction

" General:
" TODO, temporary colors?
let s:gray1 = ['#585858', 240]
let s:gray2 = ['#949494', 246]
let s:unknown = ['#ff00ff', 13]
let s:unknown2 = ['#ffff00', 11]

call s:HF('Normal', s:fore, s:back)
call s:HF('Comment', s:gray1)
call s:HF('CursorLine', s:none, s:back2)
call s:HF('CursorLineNr', s:neutral.orange)
call s:HF('CursorColumn', s:none, s:back2)
call s:HF('ColorColumn', s:none, s:back2) " TODO, This is that vertical line at 100, make it brighter?
call s:HF('LineNr', s:gray1, s:back2)
call s:HF('NonText', s:unknown)
call s:HF('SpecialKey', s:unknown)

" hi Boolean         guifg=#AE81FF
call s:HF('Boolean', s:neutral.purple)
" hi Character       guifg=#E6DB74
call s:HF('Character', s:neutral.yellow)
" hi Number          guifg=#AE81FF
call s:HF('Number', s:neutral.purple)
" hi String          guifg=#E6DB74
call s:HF('String', s:neutral.yellow)
" hi Conditional     guifg=#F92672               gui=bold
call s:HF('Conditional', s:neutral.red, s:none, s:bold)
" hi Constant        guifg=#AE81FF               gui=bold
call s:HF('Constant', s:neutral.purple, s:none, s:bold)
" hi Cursor          guifg=#000000 guibg=#F8F8F0
call s:HF('Cursor', s:unknown, s:fore)
" hi iCursor         guifg=#000000 guibg=#F8F8F0
call s:HF('iCursor', s:unknown, s:fore)
" hi Debug           guifg=#BCA3A3               gui=bold
call s:HF('Debug', s:unknown, s:none, s:bold)
" hi Define          guifg=#66D9EF
call s:HF('Define', s:neutral.aqua)
call s:HF('Delimiter', s:unknown2)

" hi DiffAdd                       guibg=#13354A
" hi DiffChange      guifg=#89807D guibg=#4C4745
" hi DiffDelete      guifg=#960050 guibg=#1E0010
" hi DiffText                      guibg=#4C4745 gui=italic,bold

" hi Directory       guifg=#A6E22E               gui=bold
" hi Error           guifg=#E6DB74 guibg=#1E0010
" hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
" hi Exception       guifg=#A6E22E               gui=bold
" hi Float           guifg=#AE81FF
" hi FoldColumn      guifg=#465457 guibg=#000000
" hi Folded          guifg=#465457 guibg=#000000
" hi Function        guifg=#A6E22E
" hi Identifier      guifg=#FD971F
" hi Ignore          guifg=#808080 guibg=bg
" hi IncSearch       guifg=#C4BE89 guibg=#000000

" hi Keyword         guifg=#F92672               gui=bold
" hi Label           guifg=#E6DB74               gui=none
" hi Macro           guifg=#C4BE89               gui=italic
" hi SpecialKey      guifg=#66D9EF               gui=italic

" hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
" hi ModeMsg         guifg=#E6DB74
" hi MoreMsg         guifg=#E6DB74
" hi Operator        guifg=#F92672

" " complete menu
" hi Pmenu           guifg=#66D9EF guibg=#000000
" hi PmenuSel                      guibg=#808080
" hi PmenuSbar                     guibg=#080808
" hi PmenuThumb      guifg=#66D9EF

" hi PreCondit       guifg=#A6E22E               gui=bold
" hi PreProc         guifg=#A6E22E
" hi Question        guifg=#66D9EF
" hi Repeat          guifg=#F92672               gui=bold
" hi Search          guifg=#000000 guibg=#FFE792
" " marks
" hi SignColumn      guifg=#A6E22E guibg=#232526
" hi SpecialChar     guifg=#F92672               gui=bold
" hi SpecialComment  guifg=#7E8E91               gui=bold
" hi Special         guifg=#66D9EF guibg=bg      gui=italic
" if has("spell")
    " hi SpellBad    guisp=#FF0000 gui=undercurl
    " hi SpellCap    guisp=#7070F0 gui=undercurl
    " hi SpellLocal  guisp=#70F0F0 gui=undercurl
    " hi SpellRare   guisp=#FFFFFF gui=undercurl
" endif
" hi Statement       guifg=#F92672               gui=bold
" hi StatusLine      guifg=#455354 guibg=fg
" hi StatusLineNC    guifg=#808080 guibg=#080808
" hi StorageClass    guifg=#FD971F               gui=italic
" hi Structure       guifg=#66D9EF
" hi Tag             guifg=#F92672               gui=italic
" hi Title           guifg=#ef5939
" hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

" hi Typedef         guifg=#66D9EF
" hi Type            guifg=#66D9EF               gui=none
" hi Underlined      guifg=#808080               gui=underline

" hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
" hi VisualNOS                     guibg=#403D3D
" hi Visual                        guibg=#403D3D
" hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
" hi WildMenu        guifg=#66D9EF guibg=#000000

" hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
" hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none

set background=dark
