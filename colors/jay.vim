" =============================================================================
" Author: josuegaleas
" License: MIT License
" Source: https://github.com/josuegaleas/jay
" Last Edit: 2024.11.24
" =============================================================================

""" Initial Setup:
highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "jay"
let s:bgIsDark = &background ==# "dark"

""" Options:
let s:transparent = get(g:, 'jay_transparent', 0)

""" Palette:
let s:none = ['NONE', 'NONE']
if s:bgIsDark
	" Regular Colors
	let s:red = ['#df5f5f', 167]
	let s:orange = ['#dfaf5f', 179]
	let s:yellow = ['#dfdf5f', 185]
	let s:green = ['#5fdf5f', 77]
	let s:aqua = ['#5fdfdf', 80]
	let s:blue = ['#5f87df', 68]
	let s:purple = ['#af5fdf', 134]
	" Background Colors
	let s:back0 = ['#080808', 232]
	let s:back = ['#121212', 233]
	let s:back2 = ['#1c1c1c', 234]
	let s:back3 = ['#444444', 238]
	let s:back4 = ['#666666', 242]
	" Foreground Colors
	let s:fore0 = ['#eeeeee', 255]
	let s:fore = ['#e4e4e4', 254]
	let s:fore2 = ['#c6c6c6', 251]
	let s:fore3 = ['#a8a8a8', 248]
	let s:fore4 = ['#8a8a8a', 245]
else
	" Regular Colors
	let s:red = ['#af0000', 124]
	let s:orange = ['#af8700', 136]
	let s:yellow = ['#afaf00', 142]
	let s:green = ['#00af00', 34]
	let s:aqua = ['#00afaf', 37]
	let s:blue = ['#005faf', 25]
	let s:purple = ['#8700af', 91]
	" Background Colors
	let s:back0 = ['#eeeeee', 255]
	let s:back = ['#e4e4e4', 254]
	let s:back2 = ['#dadada', 253]
	let s:back3 = ['#b2b2b2', 249]
	let s:back4 = ['#8a8a8a', 245]
	" Foreground Colors
	let s:fore0 = ['#080808', 232]
	let s:fore = ['#121212', 233]
	let s:fore2 = ['#303030', 236]
	let s:fore3 = ['#4e4e4e', 239]
	let s:fore4 = ['#666666', 242]
endif
" Placeholder Colors
let s:unknown = ['#ff00ff', 201]
let s:unknown2 = ['#ffff00', 226]
" Emphasis
let s:bold = 'bold'
let s:underline = 'underline'

if &t_Co >= 16 && &t_Co < 256
	" At the mercy of the terminal's colors so results may vary
	if s:bgIsDark
		let s:red[1] = 9
		let s:orange[1] = 11 "Not actually orange, yellow will have to suffice
		let s:yellow[1] = 11
		let s:green[1] = 10
		let s:aqua[1] = 14
		let s:blue[1] = 12
		let s:purple[1] = 13

		let s:back0[1] = 0
		let s:back[1] = 0
		let s:back2[1] = 0
		let s:back3[1] = 8
		let s:back4[1] = 8
		let s:fore0[1] = 15
		let s:fore[1] = 15
		let s:fore2[1] = 7
		let s:fore3[1] = 7
		let s:fore4[1] = 7
	else
		let s:red[1] = 1
		let s:orange[1] = 3 " Not actually orange, yellow will have to suffice
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
		let s:fore2[1] = 8
		let s:fore3[1] = 8
		let s:fore4[1] = 8
	endif
endif

if &t_Co < 16
	finish
endif

""" Highlighting Functions:
" Based on gruvbox's highlighting function found here:
" https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim#L374
if s:transparent == 1
	function! s:HF(group, fg, ...)
		let l:em = get(a:, 2, 'NONE')

		execute join(['highlight', a:group,
					\ 'term='.em,
					\ 'cterm='.em,
					\ 'ctermfg='.a:fg[1],
					\ 'ctermbg=NONE',
					\ 'gui='.em,
					\ 'guifg='.a:fg[0],
					\ 'guibg=NONE'
					\], ' ')
	endfunction
else
	function! s:HF(group, fg, ...)
		let l:bg = get(a:, 1, s:none)
		let l:em = get(a:, 2, 'NONE')

		execute join(['highlight', a:group,
					\ 'term='.em,
					\ 'cterm='.em,
					\ 'ctermfg='.a:fg[1],
					\ 'ctermbg='.bg[1],
					\ 'gui='.em,
					\ 'guifg='.a:fg[0],
					\ 'guibg='.bg[0]
					\], ' ')
	endfunction
endif

if has("spell")
	function! s:HF_Spell(group, sp, em)
		execute join(['highlight', a:group,
					\ 'term='.a:em,
					\ 'cterm='.a:em,
					\ 'ctermfg='.a:sp[1],
					\ 'ctermbg=NONE',
					\ 'gui=undercurl',
					\ 'guifg=NONE',
					\ 'guibg=NONE',
					\ 'guisp='.a:sp[0]
					\], ' ')
	endfunction
endif

""" Highlighting:
""" Setting the Normal group first as suggested in `:help :hi-normal-cterm`
call s:HF('Normal', s:fore, s:back)
let &background = s:bgIsDark ? "dark" : "light" " Older versions of Vim need this

""" Described in `:help highlight-groups`
call s:HF('ColorColumn', s:none, s:back2)
call s:HF('Conceal', s:fore0, s:none, s:bold)
call s:HF('Cursor', s:back, s:fore)
call s:HF('lCursor', s:back, s:aqua)
call s:HF('CursorIM', s:back, s:purple)
call s:HF('CursorColumn', s:none, s:back2)
call s:HF('CursorLine', s:none, s:back2)
call s:HF('Directory', s:green)
call s:HF('DiffAdd', s:green, s:back2)
call s:HF('DiffChange', s:yellow, s:back2)
call s:HF('DiffDelete', s:red, s:back2)
call s:HF('DiffText', s:blue, s:back2, s:underline)
" EndOfBuffer linked to NonText
call s:HF('ErrorMsg', s:red) " Command Error
call s:HF('VertSplit', s:back3, s:back0)
call s:HF('Folded', s:back3, s:back0)
call s:HF('FoldColumn', s:blue, s:back0)
call s:HF('SignColumn', s:none, s:back0)
call s:HF('IncSearch', s:fore, s:back4)
call s:HF('LineNr', s:back4, s:back2)
" Intentionally not setting LineNrAbove and LineNrBelow
call s:HF('CursorLineNr', s:orange)
" Intentionally not setting CursorLineFold and CursorLineSign
call s:HF('MatchParen', s:back, s:orange)
" MessageWindow linked to WarningMsg
call s:HF('ModeMsg', s:fore)
" Intentionally not setting MsgArea
call s:HF('MoreMsg', s:blue) " Command More
call s:HF('NonText', s:back3)
call s:HF('Pmenu', s:aqua, s:back0)
call s:HF('PmenuSel', s:fore, s:back2)
call s:HF('PmenuKind', s:back4, s:back0)
call s:HF('PmenuKindSel', s:fore2, s:back2)
call s:HF('PmenuExtra', s:back3, s:back0)
call s:HF('PmenuExtraSel', s:fore3, s:back2)
call s:HF('PmenuSbar', s:none, s:back2)
call s:HF('PmenuThumb', s:none, s:back3)
call s:HF('PmenuMatch', s:fore2, s:back0)
call s:HF('PmenuMatchSel', s:fore, s:back3)
" PopupNotification linked to WarningMsg
call s:HF('Question', s:green) " Command Question
call s:HF('QuickFixLine', s:none, s:back3)
call s:HF('Search', s:fore2, s:back3)
call s:HF('CurSearch', s:fore, s:back4, s:underline)
call s:HF('SpecialKey', s:back3)
if has("spell")
	call s:HF_Spell('SpellBad', s:red, s:underline)
	call s:HF_Spell('SpellCap', s:orange, s:underline)
	call s:HF_Spell('SpellLocal', s:green, s:underline)
	call s:HF_Spell('SpellRare', s:purple, s:underline)
endif
call s:HF('Statusline', s:fore3, s:back2)
call s:HF('StatuslineNC', s:back3, s:back2)
call s:HF('StatusLineTerm', s:back, s:green)
call s:HF('StatusLineTermNC', s:green, s:back2)
call s:HF('TabLine', s:fore3, s:back2)
call s:HF('TabLineFill', s:none, s:back2)
call s:HF('TabLineSel', s:back2, s:back4)
" Terminal linked to Normal according to `:help terminal-size-color`
call s:HF('Title', s:red)
call s:HF('Visual', s:none, s:back3)
call s:HF('VisualNOS', s:none, s:back3)
call s:HF('WarningMsg', s:orange) " Command Warning
call s:HF('WildMenu', s:aqua, s:back0)

""" Described in `:help group-name`
call s:HF('Comment', s:back4)
call s:HF('Constant', s:purple)
call s:HF('String', s:yellow)
call s:HF('Character', s:yellow)
call s:HF('Number', s:purple)
call s:HF('Boolean', s:purple)
call s:HF('Float', s:purple)
call s:HF('Identifier', s:orange)
call s:HF('Function', s:green)
call s:HF('Statement', s:red)
call s:HF('Conditional', s:red)
call s:HF('Repeat', s:red)
call s:HF('Label', s:yellow)
call s:HF('Operator', s:red)
call s:HF('Keyword', s:red)
call s:HF('Exception', s:green)
call s:HF('PreProc', s:green)
call s:HF('Include', s:green)
call s:HF('Define', s:orange)
call s:HF('Macro', s:yellow)
call s:HF('PreCondit', s:green)
call s:HF('Type', s:aqua)
call s:HF('StorageClass', s:orange)
call s:HF('Structure', s:orange)
call s:HF('Typedef', s:aqua)
call s:HF('Special', s:aqua)
call s:HF('SpecialChar', s:red)
call s:HF('Tag', s:red)
call s:HF('Delimiter', s:fore4)
call s:HF('SpecialComment', s:fore3)
call s:HF('Debug', s:orange, s:none, s:bold)
call s:HF('Underlined', s:blue, s:none, s:underline)
call s:HF('Ignore', s:fore3)
call s:HF('Error', s:red, s:back0, s:bold)
call s:HF('Todo', s:fore0, s:back0, s:bold)
call s:HF('Added', s:green, s:back2)
call s:HF('Changed', s:yellow, s:back2)
call s:HF('Removed', s:red, s:back2)

""" Described in `:help hl-debugPC` and `:help hl-debugBreakpoint`
call s:HF('debugPC', s:none, s:blue)
call s:HF('debugBreakpoint', s:none, s:red)

""" Described under `:help window-toolbar`
call s:HF('ToolbarLine', s:none, s:back2)
call s:HF('ToolbarButton', s:back2, s:back4)

""" Plugins
call s:HF('ExtraWhitespace', s:none, s:red) " Support for https://github.com/ntpeters/vim-better-whitespace

""" Terminal Colors
" Intentionally not setting g:terminal_ansi_colors

""" Transparency:
if s:transparent == 1
	function! s:HF_Emphasis(group, em)
		execute join(['highlight', a:group,
					\ 'term='.a:em,
					\ 'cterm='.a:em,
					\ 'gui='.a:em
					\], ' ')
	endfunction

	function! s:HF_Bypass(group, fg, bg)
		execute join(['highlight', a:group,
					\ 'term=NONE',
					\ 'cterm=NONE',
					\ 'ctermfg='.a:fg[1],
					\ 'ctermbg='.a:bg[1],
					\ 'gui=NONE',
					\ 'guifg='.a:fg[0],
					\ 'guibg='.a:bg[0]
					\], ' ')
	endfunction

	let s:bold_underline = 'bold,underline'

	call s:HF_Emphasis('ColorColumn', s:underline)
	call s:HF_Bypass('Cursor', s:back, s:fore)
	call s:HF_Bypass('lCursor', s:back, s:aqua)
	call s:HF_Bypass('CursorIM', s:back, s:purple)
	call s:HF_Emphasis('CursorColumn', s:underline)
	call s:HF_Emphasis('CursorLine', s:underline)
	call s:HF_Emphasis('DiffAdd', s:bold)
	call s:HF_Emphasis('DiffChange', s:bold)
	call s:HF_Emphasis('DiffDelete', s:bold)
	call s:HF_Emphasis('DiffText', s:bold_underline)
	call s:HF_Bypass('MatchParen', s:back, s:orange)
	call s:HF_Emphasis('PmenuThumb', s:underline)
	call s:HF_Emphasis('QuickFixLine', s:bold)
	call s:HF_Emphasis('Search', s:underline)
	call s:HF_Emphasis('CurSearch', s:bold_underline)
	call s:HF('StatusLineTerm', s:green)
	call s:HF('StatusLineTermNC', s:back3)
	call s:HF('TabLineSel', s:fore, s:none, s:underline)
	call s:HF_Emphasis('Visual', s:bold_underline)
	call s:HF_Emphasis('VisualNOS', s:bold_underline)
	call s:HF_Emphasis('Added', s:bold)
	call s:HF_Emphasis('Changed', s:bold)
	call s:HF_Emphasis('Removed', s:bold)
	call s:HF_Bypass('debugPC', s:none, s:blue)
	call s:HF_Bypass('debugBreakpoint', s:none, s:red)
	call s:HF('ToolbarButton', s:fore, s:none, s:underline)
	call s:HF_Bypass('ExtraWhitespace', s:none, s:red)
endif
