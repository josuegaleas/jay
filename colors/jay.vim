" =============================================================================
" Author: josuegaleas
" License: MIT License
" Source: https://github.com/josuegaleas/jay
" Last Edit: October 2, 2017
" =============================================================================

" Initial Setup:
hi clear

if exists("syntax_on")
	syntax reset
endif

let s:original_background = &background "FIXME
let g:colors_name = "jay"

if exists("jay_transparent")
	let s:transparent = jay_transparent
else
	let s:transparent = 0
endif

" Palette:
let s:none = ['NONE', 'NONE']
" Regular Colors
let s:red = ['#df5f5f', 167]
let s:orange = ['#dfaf5f', 179]
let s:yellow = ['#dfdf5f', 185]
let s:green = ['#5fdf5f', 77]
let s:aqua = ['#5fdfdf', 80]
let s:blue = ['#5f87df', 68]
let s:purple = ['#af5fdf', 134]
" Background Colors
let s:back0 = ['#121212', 233]
let s:back = ['#1c1c1c', 234]
let s:back2 = ['#262626', 235]
let s:back3 = ['#444444', 238]
let s:back4 = ['#606060', 241]
" Foreground Colors
let s:fore0 = ['#e4e4e4', 254]
let s:fore = ['#dadada', 253]
let s:fore2 = ['#bcbcbc', 250]
let s:fore3 = ['#9e9e9e', 247]
let s:fore4 = ['#808080', 244]
" TODO, Debugging Colors
let s:unknown = ['#0000ff', 12]
let s:unknown2 = ['#ffff00', 11]
" Emphasis
let s:bold = 'bold,'
let s:underline = 'underline,'
let s:bold_underline = 'bold,underline,'

if &background == "light"
	" Regular Colors
	let s:red = ['#af0000', 124]
	let s:orange = ['#af8700', 136]
	let s:yellow = ['#afaf00', 142]
	let s:green = ['#00af00', 34]
	let s:aqua = ['#00afaf', 37]
	let s:blue = ['#005faf', 25]
	let s:purple = ['#8700af', 91]
	" Background Colors
	let s:back0 = ['#e4e4e4', 254]
	let s:back = ['#dadada', 253]
	let s:back2 = ['#d0d0d0', 252]
	let s:back3 = ['#b2b2b2', 249]
	let s:back4 = ['#949494', 246]
	" Foreground Colors
	let s:fore0 = ['#121212', 233]
	let s:fore = ['#1c1c1c', 234]
	let s:fore2 = ['#3a3a3a', 237]
	let s:fore3 = ['#585858', 240]
	let s:fore4 = ['#767676', 243]
endif

if &t_Co == 16
	let s:red[1] = 1
	let s:orange[1] = 7
	let s:yellow[1] = 3
	let s:green[1] = 2
	let s:aqua[1] = 6
	let s:blue[1] =  4
	let s:purple[1] = 5
	let s:back0[1] = 0
	let s:back[1] = 0
	let s:back2[1] = 0
	let s:back3[1] = 8
	let s:back4[1] = 8
	let s:fore0[1] = 15
	let s:fore[1] = 15
	let s:fore2[1] = 15
	let s:fore3[1] = 7
	let s:fore4[1] = 7

	if &background == "light"
		let s:red[1] = 1
		let s:orange[1] = 7
		let s:yellow[1] = 3
		let s:green[1] = 2
		let s:aqua[1] = 6
		let s:blue[1] =  4
		let s:purple[1] = 5
		let s:back0[1] = 15
		let s:back[1] = 15
		let s:back2[1] = 15
		let s:back3[1] = 7
		let s:back4[1] = 7
		let s:fore0[1] = 0
		let s:fore[1] = 0
		let s:fore2[1] = 0
		let s:fore3[1] = 8
		let s:fore4[1] = 8
	endif
endif

" Highlighting Function:
" Heavily based on gruvbox's highlighting function,
" which can be found at: https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim#L346
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
	if a:0 >= 2
		let emstr = a:2
	else
		let emstr = 'none,'
	endif

	" Highlight
	execute join(['hi', a:group,
				\ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
				\ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
				\ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2],
				\ 'term=' . emstr[:-2]], ' ')
endfunction

if has("spell")
	function! s:HFS(group, sp)
		execute join(['hi', a:group,
					\ 'guisp=' . a:sp[0],
					\ 'guifg=NONE ctermfg=' . a:sp[1],
					\ 'guibg=NONE ctermbg=' . s:back3[1],
					\ 'gui=bold,undercurl cterm=bold,undercurl',
					\ 'term=bold,undercurl '])
	endfunction
endif

" Highlighting:
call s:HF('SpecialKey', s:back3)
call s:HF('NonText', s:back3)
call s:HF('Directory', s:green)
call s:HF('ErrorMsg', s:red) "Command Error
call s:HF('IncSearch', s:fore, s:back4)
call s:HF('Search', s:fore2, s:back3, s:bold)
call s:HF('MoreMsg', s:blue) "Command More
call s:HF('ModeMsg', s:fore)
call s:HF('LineNr', s:back4, s:back2)
call s:HF('CursorLineNr', s:orange)
call s:HF('Question', s:green) "Command Question
call s:HF('Statusline', s:fore3, s:back2)
call s:HF('StatuslineNC', s:back3, s:back2)
call s:HF('VertSplit', s:back3, s:back0, s:bold)
call s:HF('Title', s:red)
call s:HF('Visual', s:none, s:back3)
call s:HF('VisualNOS', s:none, s:back3)
call s:HF('WarningMsg', s:orange) "Command Warning
call s:HF('WildMenu', s:aqua, s:back0)
call s:HF('Folded', s:back3, s:back0)
call s:HF('FoldColumn', s:blue, s:back0)
call s:HF('DiffAdd', s:green, s:back2)
call s:HF('DiffChange', s:yellow, s:back2)
call s:HF('DiffDelete', s:red, s:back2)
call s:HF('DiffText', s:blue, s:back2, s:bold_underline)
call s:HF('SignColumn', s:none, s:back0)
call s:HF('Conceal', s:unknown, s:unknown2, s:bold_underline) "FIXME
if has("spell")
	call s:HFS('SpellBad', s:red)
	call s:HFS('SpellCap', s:orange)
	call s:HFS('SpellRare', s:purple)
	call s:HFS('SpellLocal', s:green)
endif
call s:HF('Pmenu', s:aqua, s:back0)
call s:HF('PmenuSel', s:fore, s:back2)
call s:HF('PmenuSbar', s:none, s:back2)
call s:HF('PmenuThumb', s:none, s:back3)
call s:HF('TabLine', s:fore2, s:back3)
call s:HF('TabLineSel', s:back2, s:back4, s:bold)
call s:HF('TabLineFill', s:none, s:back2)
call s:HF('CursorColumn', s:none, s:back2)
call s:HF('CursorLine', s:none, s:back2)
call s:HF('ColorColumn', s:none, s:back2)
call s:HF('Cursor', s:back, s:fore)
call s:HF('lCursor', s:back, s:fore)
call s:HF('MatchParen', s:back, s:orange, s:bold)
call s:HF('Normal', s:fore, s:back)
let &background = s:original_background "FIXME
call s:HF('Comment', s:back4)
call s:HF('Constant', s:purple)
call s:HF('Special', s:aqua)
call s:HF('Identifier', s:orange)
call s:HF('Statement', s:red)
call s:HF('PreProc', s:green)
call s:HF('Type', s:aqua)
call s:HF('Underlined', s:blue, s:none, s:underline)
call s:HF('Ignore', s:fore3)
call s:HF('Error', s:red, s:back0, s:bold)
call s:HF('Todo', s:fore0, s:back0, s:bold)
call s:HF('String', s:yellow)
call s:HF('Character', s:yellow)
call s:HF('Number', s:purple)
call s:HF('Boolean', s:purple)
call s:HF('Float', s:purple)
call s:HF('Function', s:green)
call s:HF('Conditional', s:red)
call s:HF('Repeat', s:red)
call s:HF('Label', s:yellow)
call s:HF('Operator', s:red)
call s:HF('Keyword', s:red)
call s:HF('Exception', s:green)
call s:HF('Define', s:orange)
call s:HF('Macro', s:yellow)
call s:HF('PreCondit', s:green)
call s:HF('StorageClass', s:orange)
call s:HF('Structure', s:orange)
call s:HF('Typedef', s:aqua)
call s:HF('Tag', s:red)
call s:HF('SpecialChar', s:red)
call s:HF('Delimiter', s:fore4)
call s:HF('SpecialComment', s:fore3)
call s:HF('Debug', s:unknown, s:unknown2, s:bold_underline) "FIXME

" Transparency:
if s:transparent == 1
	call s:HF('IncSearch', s:fore, s:none, s:bold)
	call s:HF('Search', s:fore2, s:none, s:bold_underline)
	call s:HF('LineNr', s:back4, s:none)
	call s:HF('Statusline', s:fore3, s:none)
	call s:HF('StatuslineNC', s:back3, s:none)
	call s:HF('VertSplit', s:back3, s:none, s:bold)
	call s:HF('Visual', s:none, s:none, s:bold_underline)
	call s:HF('VisualNOS', s:none, s:none, s:bold_underline)
	call s:HF('WildMenu', s:aqua, s:none)
	call s:HF('Folded', s:back3, s:none)
	call s:HF('FoldColumn', s:blue, s:none)
	call s:HF('DiffAdd', s:green, s:none, s:bold)
	call s:HF('DiffChange', s:yellow, s:none, s:bold)
	call s:HF('DiffDelete', s:red, s:none, s:bold)
	call s:HF('DiffText', s:blue, s:none, s:bold_underline)
	call s:HF('SignColumn', s:none, s:none)
	call s:HF('Pmenu', s:aqua, s:none)
	call s:HF('PmenuSel', s:fore, s:none)
	call s:HF('PmenuSbar', s:none, s:none)
	call s:HF('PmenuThumb', s:none, s:none)
	call s:HF('TabLine', s:fore2, s:none)
	call s:HF('TabLineSel', s:back4, s:none, s:bold)
	call s:HF('TabLineFill', s:none, s:none)
	call s:HF('CursorColumn', s:none, s:none, s:underline)
	call s:HF('CursorLine', s:none, s:none, s:underline)
	call s:HF('ColorColumn', s:none, s:none, s:underline)
	call s:HF('Cursor', s:none, s:fore)
	call s:HF('lCursor', s:none, s:fore)
	call s:HF('MatchParen', s:back, s:orange, s:bold) "FIXME
	call s:HF('Normal', s:fore, s:none)
	let &background = s:original_background "FIXME
	call s:HF('Error', s:red, s:none, s:bold)
	call s:HF('Todo', s:fore0, s:none, s:bold)
endif
