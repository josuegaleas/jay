" =============================================================================
" Author: josuegaleas
" License: MIT License
" Last Change: December 27th, 2016
" =============================================================================

" Palette:
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

" Theme:
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

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

let s:p.tabline.left = [ [ s:fore2, s:back3 ] ]
let s:p.tabline.tabsel = [ [ s:back2, s:back4 ] ]
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#jay_light#palette = lightline#colorscheme#flatten(s:p)
