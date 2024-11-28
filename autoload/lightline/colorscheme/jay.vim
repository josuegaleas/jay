" =============================================================================
" Author: josuegaleas
" License: MIT License
" Source: https://github.com/josuegaleas/jay
" Last Change: 2024.11.24
" =============================================================================

" Palette:
let s:none = ['NONE', 'NONE']
if &background == "dark"
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

" Options:
let s:transparent = get(g:, 'jay_transparent', 0)

" Theme:
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if s:transparent == 0
	let s:p.normal.left = [[s:back2, s:back4], [s:fore2, s:back3]]
	let s:p.normal.middle = [[s:fore3, s:back2]]
	let s:p.normal.right = copy(s:p.normal.left)
	let s:p.normal.error = [[s:back2, s:red]]
	let s:p.normal.warning = [[s:back2, s:orange]]

	let s:p.insert.left = [[s:back2, s:green], [s:fore2, s:back3]]
	let s:p.insert.right = copy(s:p.insert.left)
	let s:p.replace.left = [[s:back2, s:purple], [s:fore2, s:back3]]
	let s:p.replace.right = copy(s:p.replace.left)
	let s:p.visual.left = [[s:back2, s:blue], [s:fore2, s:back3]]
	let s:p.visual.right = copy(s:p.visual.left)

	let s:p.inactive.left = [[s:back3, s:back2], [s:back3, s:back2]]
	let s:p.inactive.middle = [[s:back3, s:back2]]
	let s:p.inactive.right = copy(s:p.inactive.left)

	let s:p.tabline.left = [[s:fore3, s:back2]]
	let s:p.tabline.tabsel = [[s:back2, s:back4]]
	let s:p.tabline.middle = [[s:none, s:back2]]
	let s:p.tabline.right = copy(s:p.tabline.left)
else
	let s:p.normal.left = [[s:fore, s:none], [s:fore2, s:none]]
	let s:p.normal.middle = [[s:fore3, s:none]]
	let s:p.normal.right = copy(s:p.normal.left)
	let s:p.normal.error = [[s:red, s:none]]
	let s:p.normal.warning = [[s:orange, s:none]]

	let s:p.insert.left = [[s:green, s:none], [s:fore2, s:none]]
	let s:p.insert.right = copy(s:p.insert.left)
	let s:p.replace.left = [[s:purple, s:none], [s:fore2, s:none]]
	let s:p.replace.right = copy(s:p.replace.left)
	let s:p.visual.left = [[s:blue, s:none], [s:fore2, s:none]]
	let s:p.visual.right = copy(s:p.visual.left)

	let s:p.inactive.left = [[s:back3, s:none], [s:back3, s:none]]
	let s:p.inactive.middle = [[s:back3, s:none]]
	let s:p.inactive.right = copy(s:p.inactive.left)

	let s:p.tabline.left = [[s:fore3, s:none]]
	let s:p.tabline.tabsel = [[s:fore, s:none]]
	let s:p.tabline.middle = [[s:none, s:none]]
	let s:p.tabline.right = copy(s:p.tabline.left)
endif

let g:lightline#colorscheme#jay#palette = lightline#colorscheme#flatten(s:p)
