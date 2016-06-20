" Author: Josue <jdevalerie@gmail.com>
" Source: https://github.com/josuegaleas/jay
" Last Edit: June 19, 2016
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
let s:plain = 'none,'
let s:bold = 'bold,'
let s:underline = 'underline,'
let s:bold_underline = 'bold,underline,'

" Highlighting Function:
" TODO, heavily based on gruvbox's highlighting function
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
				\ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]]

	execute join(histring, ' ')
endfunction

" General:
" TODO, temporary debugging colors
let s:unknown = ['#ff00ff', 13]
let s:unknown2 = ['#ffff00', 11]
let s:unknown3 = ['#00ff00', 10]
let s:unknown4 = ['#00ffff', 14]

call s:HF('Normal', s:fore, s:back)
call s:HF('CursorLine', s:none, s:back2, s:plain) "TODO, the highlight messes with highlighted searches and TODO
call s:HF('CursorLineNr', s:orange, s:none, s:plain)

call s:HF('Boolean', s:purple)
call s:HF('Character', s:yellow)
call s:HF('Number', s:purple)
call s:HF('String', s:yellow)
call s:HF('Conditional', s:red, s:none, s:bold)
call s:HF('Constant', s:purple, s:none, s:bold)
call s:HF('Cursor', s:back0, s:unknown) "TODO, is this only in GUI?
call s:HF('Debug', s:unknown2, s:none, s:bold)
call s:HF('Define', s:aqua)
call s:HF('Delimiter', s:back4)

call s:HF('DiffAdd', s:green, s:back2)
call s:HF('DiffChange', s:yellow, s:back2)
call s:HF('DiffDelete', s:red, s:back2)
call s:HF('DiffText', s:blue, s:back2, s:bold_underline)

call s:HF('Directory', s:green, s:none, s:bold)
call s:HF('Error', s:yellow, s:back0) "TODO, not sure what this does
call s:HF('ErrorMsg', s:red, s:back0, s:bold)
call s:HF('Exception', s:green, s:none, s:bold)
call s:HF('Float', s:purple)
call s:HF('FoldColumn', s:blue, s:back0)
call s:HF('Folded', s:back4, s:back0)
call s:HF('Function', s:green)
call s:HF('Identifier', s:orange, s:none, s:plain)
call s:HF('Ignore', s:unknown3, s:back0)
call s:HF('IncSearch', s:back, s:green) "TODO, maybe change green to something else

call s:HF('Keyword', s:unknown4, s:none, s:bold)
call s:HF('Label', s:yellow, s:none, s:plain)
call s:HF('Macro', s:blue)

call s:HF('MatchParen', s:back0, s:orange, s:bold)
call s:HF('ModeMsg', s:fore)
call s:HF('MoreMsg', s:unknown4)
call s:HF('Operator', s:red)

call s:HF('Pmenu', s:aqua, s:back0)
call s:HF('PmenuSel', s:fore, s:back2)
call s:HF('PmenuSbar', s:none, s:back0)
call s:HF('PmenuThumb', s:unknown4)

call s:HF('PreCondit', s:green, s:none, s:bold)
call s:HF('PreProc', s:green)
call s:HF('Question', s:aqua)
call s:HF('Repeat', s:red, s:none, s:bold)
call s:HF('Search', s:back, s:yellow, s:plain) "TODO, maybe a diff color for searches

call s:HF('SignColumn', s:unknown4, s:back)
call s:HF('SpecialChar', s:red, s:none, s:bold)
call s:HF('SpecialComment', s:unknown4, s:none, s:bold)
call s:HF('Special', s:aqua)

if has("spell")
	" s:HF('SpellBad', s:red, s:none, s:underline)
	" s:HF('SpellCap', s:blue, s:none, s:underline)
	" s:HF('SpellLocal', s:aqua, s:none, s:underline)
	" s:HF('SpellRare', s:unknown4, s:none, s:underline)
endif

call s:HF('Statement', s:red, s:none, s:bold)
call s:HF('Statusline', s:fore3, s:back2)
call s:HF('StatuslineNC', s:fore, s:back)
call s:HF('StorageClass', s:orange)
call s:HF('Structure', s:aqua)
call s:HF('Tag', s:red)
call s:HF('Title', s:red)
call s:HF('Todo', s:fore, s:back, s:bold)

call s:HF('Typedef', s:aqua)
call s:HF('Type', s:aqua, s:none, s:plain)
call s:HF('Underlined', s:back4, s:none, s:underline)

call s:HF('VertSplit', s:back3, s:back0, s:bold)
call s:HF('VisualNOS', s:none, s:unknown3)
call s:HF('Visual', s:none, s:unknown4)
call s:HF('WarningMsg', s:orange, s:back, s:bold)
call s:HF('WildMenu', s:aqua, s:back0)

call s:HF('TabLine', s:fore2, s:back3)
call s:HF('TabLineFill', s:none, s:back2)
call s:HF('TabLineSel', s:back2, s:back4)

call s:HF('Comment', s:back4)
call s:HF('CursorColumn', s:none, s:back2) "TODO, has issues with highlighted text
call s:HF('ColorColumn', s:none, s:back2) "TODO, possibly the same issue as CursorColumn
call s:HF('LineNr', s:back4, s:back2)
call s:HF('NonText', s:back3)
call s:HF('SpecialKey', s:back3)

set background=dark
