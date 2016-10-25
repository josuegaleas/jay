" =============================================================================
" Author: josuegaleas
" License: MIT License
" Last Change: October 25th, 2016
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

" Theme:
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:back2, s:back4 ], [ s:fore2, s:back3 ] ]
let s:p.normal.middle = [ [ s:fore3, s:back2 ] ]
let s:p.normal.right = copy(s:p.normal.left)
let s:p.normal.error = [ [ s:back2, s:red ] ]
let s:p.normal.warning = [ [ s:back2, s:orange ] ]

let s:p.inactive.left = [ [ s:back3, s:back2 ], [ s:back3, s:back2 ] ]
let s:p.inactive.middle = [ [ s:back3, s:back2 ] ]
let s:p.inactive.right = copy(s:p.inactive.left)

let s:p.insert.left = [ [ s:back3, s:green ], [ s:fore2, s:back3 ] ]
let s:p.replace.left = [ [ s:back3, s:purple ], [ s:fore2, s:back3 ] ]
let s:p.visual.left = [ [ s:back3, s:blue ], [ s:fore2, s:back3 ] ]

let s:p.tabline.left = [ [ s:fore2, s:back3 ] ]
let s:p.tabline.tabsel = [ [ s:back2, s:back4 ] ]
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#jay#palette = lightline#colorscheme#flatten(s:p)
