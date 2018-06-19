" =============================================================================
" Author: josuegaleas
" License: MIT License
" Source: https://github.com/josuegaleas/jay
" Last Change: 2017.10.10
" =============================================================================

" Palette:
let s:red = ['#df5f5f', 167]
let s:orange = ['#dfaf5f', 179]
let s:green = ['#5fdf5f', 77]
let s:blue = ['#5f87df', 68]
let s:purple = ['#af5fdf', 134]
let s:back2 = ['#262626', 235]
let s:back3 = ['#444444', 238]
let s:back4 = ['#606060', 241]
let s:fore2 = ['#bcbcbc', 250]
let s:fore3 = ['#9e9e9e', 247]
let s:none = ['NONE', 'NONE']

if &background == "light"
	let s:red = ['#af0000', 124]
	let s:orange = ['#af8700', 136]
	let s:green = ['#00af00', 34]
	let s:blue = ['#005faf', 25]
	let s:purple = ['#8700af', 91]
	let s:back2 = ['#d0d0d0', 252]
	let s:back3 = ['#b2b2b2', 249]
	let s:back4 = ['#949494', 246]
	let s:fore2 = ['#3a3a3a', 237]
	let s:fore3 = ['#585858', 240]
endif

if exists("jay_transparent")
	let s:transparent = jay_transparent
else
	let s:transparent = 0
endif

" Theme:
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if s:transparent == 0
	let s:p.normal.left = [ [ s:back2, s:back4 ], [ s:fore2, s:back3 ] ]
	let s:p.normal.middle = [ [ s:fore3, s:back2 ] ]
	let s:p.normal.right = copy(s:p.normal.left)
	let s:p.normal.error = [ [ s:back2, s:red ] ]
	let s:p.normal.warning = [ [ s:back2, s:orange ] ]

	let s:p.insert.left = [ [ s:back2, s:green ], [ s:fore2, s:back3 ] ]
	let s:p.insert.right = copy(s:p.insert.left)
	let s:p.replace.left = [ [ s:back2, s:purple ], [ s:fore2, s:back3 ] ]
	let s:p.replace.right = copy(s:p.replace.left)
	let s:p.visual.left = [ [ s:back2, s:blue ], [ s:fore2, s:back3 ] ]
	let s:p.visual.right = copy(s:p.visual.left)

	let s:p.inactive.left = [ [ s:back3, s:back2 ], [ s:back3, s:back2 ] ]
	let s:p.inactive.middle = [ [ s:back3, s:back2 ] ]
	let s:p.inactive.right = copy(s:p.inactive.left)
else
	let s:p.normal.left = [ [ s:back4, s:none ], [ s:fore2, s:none ] ]
	let s:p.normal.middle = [ [ s:fore3, s:none ] ]
	let s:p.normal.right = copy(s:p.normal.left)
	let s:p.normal.error = [ [ s:red, s:none ] ]
	let s:p.normal.warning = [ [ s:orange, s:none ] ]

	let s:p.insert.left = [ [ s:green, s:none ], [ s:fore2, s:none ] ]
	let s:p.insert.right = copy(s:p.insert.left)
	let s:p.replace.left = [ [ s:purple, s:none ], [ s:fore2, s:none ] ]
	let s:p.replace.right = copy(s:p.replace.left)
	let s:p.visual.left = [ [ s:blue, s:none ], [ s:fore2, s:none ] ]
	let s:p.visual.right = copy(s:p.visual.left)

	let s:p.inactive.left = [ [ s:back2, s:none ], [ s:back2, s:none ] ]
	let s:p.inactive.middle = [ [ s:back2, s:none ] ]
	let s:p.inactive.right = copy(s:p.inactive.left)
endif

let s:p.tabline.left = copy(s:p.normal.middle)
let s:p.tabline.tabsel = copy(s:p.normal.left)
let s:p.tabline.middle = copy(s:p.inactive.middle)
let s:p.tabline.right = copy(s:p.tabline.tabsel)

let g:lightline#colorscheme#jay#palette = lightline#colorscheme#flatten(s:p)
