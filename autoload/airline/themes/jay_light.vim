" =============================================================================
" Author: josuegaleas
" License: MIT License
" Last Change: December 27th, 2016
" =============================================================================

" Palette:
let s:red = ['#af0000', 124]
let s:orange = ['#af8700', 136]
let s:yellow = ['#afaf00', 142]
let s:green = ['#00af00', 34]
let s:blue = ['#005faf', 25]
let s:purple = ['#8700af', 91]
let s:back2 = ['#d0d0d0', 252]
let s:back3 = ['#b2b2b2', 249]
let s:back4 = ['#949494', 246]
let s:fore2 = ['#3a3a3a', 237]
let s:fore3 = ['#585858', 240]

" Theme:
let g:airline#themes#jay_light#palette = {}

let s:mid = [s:fore2[0], s:back3[0], s:fore2[1], s:back3[1]]
let s:bot = [s:fore3[0], s:back2[0], s:fore3[1], s:back2[1]]

let s:N1 = [s:back2[0], s:back4[0], s:back2[1], s:back4[1]]
let s:I1 = [s:back2[0], s:green[0], s:back2[1], s:green[1]]
let s:R1 = [s:back2[0], s:purple[0], s:back2[1], s:purple[1]]
let s:V1 = [s:back2[0], s:blue[0], s:back2[1], s:blue[1]]

let s:N2 = [s:red[0], s:back2[0], s:red[1], s:back2[1]]
let s:I2 = [s:green[0], s:back2[0], s:green[1], s:back2[1]]
let s:R2 = [s:purple[0], s:back2[0], s:purple[1], s:back2[1]]
let s:V2 = [s:blue[0], s:back2[0], s:blue[1], s:back2[1]]

let s:inac = [s:back3[0], s:back2[0], s:back3[1], s:back2[1]]
let s:warn = [s:back2[0], s:orange[0], s:back2[1], s:orange[1], 'bold']
let s:err = [s:back2[0], s:red[0], s:back2[1], s:red[1], 'bold']

let s:T1 = [s:back2[0], s:back4[0], s:back2[1], s:back4[1], 'bold']
let s:T2 = [s:back2[0], s:yellow[0], s:back2[1], s:yellow[1], 'bold']
let s:T3 = [s:back2[0], s:orange[0], s:back2[1], s:orange[1]]

" Accents
let g:airline#themes#jay_light#palette.accents = {'red': [s:red[0], '', s:red[1], '']}

" Normal
let g:airline#themes#jay_light#palette.normal = airline#themes#generate_color_map(s:N1, s:mid, s:bot)
let g:airline#themes#jay_light#palette.normal.airline_warning = s:warn
let g:airline#themes#jay_light#palette.normal.airline_error = s:err
let g:airline#themes#jay_light#palette.normal_modified = {'airline_c': s:N2}
let g:airline#themes#jay_light#palette.normal_modified.airline_warning = s:warn
let g:airline#themes#jay_light#palette.normal_modified.airline_error = s:err

" Insert
let g:airline#themes#jay_light#palette.insert = airline#themes#generate_color_map(s:I1, s:mid, s:bot)
let g:airline#themes#jay_light#palette.insert.airline_warning = s:warn
let g:airline#themes#jay_light#palette.insert.airline_error = s:err
let g:airline#themes#jay_light#palette.insert_modified = {'airline_c': s:I2}
let g:airline#themes#jay_light#palette.insert_modified.airline_warning = s:warn
let g:airline#themes#jay_light#palette.insert_modified.airline_error = s:err

" Replace
let g:airline#themes#jay_light#palette.replace = airline#themes#generate_color_map(s:R1, s:mid, s:bot)
let g:airline#themes#jay_light#palette.replace.airline_warning = s:warn
let g:airline#themes#jay_light#palette.replace.airline_error = s:err
let g:airline#themes#jay_light#palette.replace_modified = {'airline_c': s:R2}
let g:airline#themes#jay_light#palette.replace_modified.airline_warning = s:warn
let g:airline#themes#jay_light#palette.replace_modified.airline_error = s:err

" Visual
let g:airline#themes#jay_light#palette.visual = airline#themes#generate_color_map(s:V1, s:mid, s:bot)
let g:airline#themes#jay_light#palette.visual.airline_warning = s:warn
let g:airline#themes#jay_light#palette.visual.airline_error = s:err
let g:airline#themes#jay_light#palette.visual_modified = {'airline_c': s:V2}
let g:airline#themes#jay_light#palette.visual_modified.airline_warning = s:warn
let g:airline#themes#jay_light#palette.visual_modified.airline_error = s:err

" Inactive
let g:airline#themes#jay_light#palette.inactive = airline#themes#generate_color_map(s:inac, s:inac, s:inac)
let g:airline#themes#jay_light#palette.inactive_modified = {'airline_c': s:N2}

" Tabline
let g:airline#themes#jay_light#palette.tabline = {
	\ 'airline_tabsel': s:T1,
	\ 'airline_tabtype': s:T2,
	\ 'airline_tabmod': s:err,
	\ 'airline_tabmod_unsel': s:T3,
	\ 'airline_tab_right': s:mid,
	\ 'airline_tabsel_right': s:T1,
	\ 'airline_tabmod_right': s:err,
	\ 'airline_tabmod_unsel_right': s:T3}
