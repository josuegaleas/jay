" Author: Josue <jdevalerie@gmail.com>
" Source: https://github.com/josuegaleas/jay
" Last Edit: June 18, 2016
" Description: Yet another colorscheme for Vim, great!

" Initial Setup:
hi clear

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name="jay"

" Palette:
let s:back0 = ['#121212', 233]
let s:back = ['#1c1c1c', 234]
let s:back2 = ['#262626', 235]
let s:back3 = ['#444444', 238]
let s:back4 = ['#606060', 241]

let s:fore0 = ['#e4e4e4', 254]
let s:fore = ['#dadada', 253]
let s:fore2 = ['#bcbcbc', 250]
let s:fore3 = ['#9e9e9e', 247]

" TODO, yellow is a bit hard to see against fore?
let s:red = ['#df5f5f', 167]
let s:green = ['#5fdf5f', 77]
let s:yellow = ['#dfdf5f', 185]
let s:blue = ['#5f87df', 68]
let s:purple = ['#af5fdf', 134]
let s:aqua = ['#5fdfdf', 80]
let s:orange = ['#df875f', 173]

" Constants:
let s:none = ['NONE', 'NONE']
let s:bold = 'bold,'
let s:underline = 'underline,'
let s:bold_underline = 'bold,underline,'

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
" TODO, temporary debugging colors
let s:unknown = ['#ff00ff', 13]
let s:unknown2 = ['#ffff00', 11]
let s:unknown3 = ['#00ff00', 10]
let s:unknown4 = ['#00ffff', 14]

call s:HF('Normal', s:fore, s:back)
call s:HF('Comment', s:back4)
call s:HF('CursorLine', s:none, s:back2)
call s:HF('CursorLineNr', s:orange)
call s:HF('CursorColumn', s:none, s:back2)
call s:HF('ColorColumn', s:none, s:back2)
call s:HF('LineNr', s:back4, s:back2)
call s:HF('NonText', s:back4) "TODO, seems to just control the ~ outside of the text area
call s:HF('SpecialKey', s:unknown)

call s:HF('Boolean', s:purple)
call s:HF('Character', s:yellow)
call s:HF('Number', s:purple)
call s:HF('String', s:yellow)
call s:HF('Conditional', s:red, s:none, s:bold)
call s:HF('Constant', s:purple, s:none, s:bold)
call s:HF('Cursor', s:back0, s:unknown) "TODO, GUI???
call s:HF('iCursor', s:back0, s:unknown)
call s:HF('Debug', s:unknown2, s:none, s:bold)
call s:HF('Define', s:unknown2)
call s:HF('Delimiter', s:fore3) " TODO, seems to control parentheses and curly brackets, but not square brackets hmm

" TODO, Diff seems to be good, check again when folding is highlighted
" TODO, problem when you hover over to the changed line, the DiffText disappears because the text is the same color as CursorLine, gg
" TODO, similar issue with CursorColumn with highlighted searches, wp
call s:HF('DiffAdd', s:green, s:back2)
call s:HF('DiffChange', s:yellow, s:back2)
call s:HF('DiffDelete', s:red, s:back2)
call s:HF('DiffText', s:blue, s:back2, s:bold_underline)

call s:HF('Directory', s:green, s:none, s:bold) " TODO, controls directories, just as I thought, also controls filename of error location
call s:HF('Error', s:yellow, s:back0)
call s:HF('ErrorMsg', s:red, s:back0, s:bold)
call s:HF('Exception', s:unknown2, s:none, s:bold)
call s:HF('Float', s:purple)
call s:HF('FoldColumn', s:back4, s:back0)
call s:HF('Folded', s:back4, s:back0)
call s:HF('Function', s:unknown3)
call s:HF('Identifier', s:orange)
call s:HF('Ignore', s:unknown3, s:back0)
call s:HF('IncSearch', s:unknown3, s:back4)

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
call s:HF('PreProc', s:green)
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
call s:HF('Statement', s:red, s:none, s:bold)
" hi StatusLine      guifg=#455354 guibg=fg
call s:HF('Statusline', s:fore3, s:back2)
" hi StatusLineNC    guifg=#808080 guibg=#080808
call s:HF('StatuslineNC', s:fore, s:back)
" hi StorageClass    guifg=#FD971F               gui=italic
call s:HF('StorageClass', s:orange, s:none, s:bold)
" hi Structure       guifg=#66D9EF
" hi Tag             guifg=#F92672               gui=italic
" hi Title           guifg=#ef5939
" hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

" hi Typedef         guifg=#66D9EF
" hi Type            guifg=#66D9EF               gui=none
call s:HF('Type', s:aqua)
" hi Underlined      guifg=#808080               gui=underline

" hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
" hi VisualNOS                     guibg=#403D3D
" hi Visual                        guibg=#403D3D
" hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
" hi WildMenu        guifg=#66D9EF guibg=#000000

" hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
" hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none

set background=dark
