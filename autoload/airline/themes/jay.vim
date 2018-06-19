" =============================================================================
" Author: josuegaleas
" License: MIT License
" Source: https://github.com/josuegaleas/jay
" Last Change: 2018.06.07
" =============================================================================

" Palette:
let s:red = ['#df5f5f', 167]
let s:orange = ['#dfaf5f', 179]
let s:yellow = ['#dfdf5f', 185]
let s:green = ['#5fdf5f', 77]
let s:blue = ['#5f87df', 68]
let s:purple = ['#af5fdf', 134]
let s:back2 = ['#262626', 235]
let s:back3 = ['#444444', 238]
let s:back4 = ['#606060', 241]
let s:fore2 = ['#bcbcbc', 250]
let s:fore3 = ['#9e9e9e', 247]

if &background == "light"
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
endif

if exists("jay_transparent")
	let s:transparent = jay_transparent
else
	let s:transparent = 0
endif

if s:transparent == 0
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
	let s:tab = [s:back2[0], s:back4[0], s:back2[1], s:back4[1], 'bold']
else
	let g:airline_left_sep=''
	let g:airline_right_sep=''

	let s:mid = [s:fore2[0], 'NONE', s:fore2[1], 'NONE']
	let s:bot = [s:fore3[0], 'NONE', s:fore3[1], 'NONE']

	let s:N1 = [s:back4[0], 'NONE', s:back4[1], 'NONE']
	let s:I1 = [s:green[0], 'NONE', s:green[1], 'NONE']
	let s:R1 = [s:purple[0], 'NONE', s:purple[1], 'NONE']
	let s:V1 = [s:blue[0], 'NONE', s:blue[1], 'NONE']

	let s:N2 = [s:red[0], 'NONE', s:red[1], 'NONE']
	let s:I2 = [s:green[0], 'NONE', s:green[1], 'NONE']
	let s:R2 = [s:purple[0], 'NONE', s:purple[1], 'NONE']
	let s:V2 = [s:blue[0], 'NONE', s:blue[1], 'NONE']

	let s:inac = [s:back2[0], 'NONE', s:back2[1], 'NONE']
	let s:warn = [s:orange[0], 'NONE', s:orange[1], 'NONE', 'bold']
	let s:err = [s:red[0], 'NONE', s:red[1], 'NONE', 'bold']
	let s:tab = [s:back4[0], 'NONE', s:back4[1], 'NONE', 'bold']
endif

" Theme:
let g:airline#themes#jay#palette = {}

" Accents
let g:airline#themes#jay#palette.accents = {
			\ 'red': [s:red[0], '', s:red[1], ''],
			\ 'green': [s:green[0], '', s:green[1], ''],
			\ 'blue': [s:blue[0], '', s:blue[1], ''],
			\ 'yellow': [s:yellow[0], '', s:yellow[1], ''],
			\ 'orange': [s:orange[0], '', s:orange[1], ''],
			\ 'purple': [s:purple[0], '', s:purple[1], '']}

" Normal
let g:airline#themes#jay#palette.normal = airline#themes#generate_color_map(s:N1, s:mid, s:bot)
let g:airline#themes#jay#palette.normal.airline_warning = s:warn
let g:airline#themes#jay#palette.normal.airline_error = s:err
let g:airline#themes#jay#palette.normal_modified = {'airline_c': s:N2}
let g:airline#themes#jay#palette.normal_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.normal_modified.airline_error = s:err

" Insert
let g:airline#themes#jay#palette.insert = airline#themes#generate_color_map(s:I1, s:mid, s:bot)
let g:airline#themes#jay#palette.insert.airline_warning = s:warn
let g:airline#themes#jay#palette.insert.airline_error = s:err
let g:airline#themes#jay#palette.insert_modified = {'airline_c': s:I2}
let g:airline#themes#jay#palette.insert_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.insert_modified.airline_error = s:err

" Replace
let g:airline#themes#jay#palette.replace = airline#themes#generate_color_map(s:R1, s:mid, s:bot)
let g:airline#themes#jay#palette.replace.airline_warning = s:warn
let g:airline#themes#jay#palette.replace.airline_error = s:err
let g:airline#themes#jay#palette.replace_modified = {'airline_c': s:R2}
let g:airline#themes#jay#palette.replace_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.replace_modified.airline_error = s:err

" Visual
let g:airline#themes#jay#palette.visual = airline#themes#generate_color_map(s:V1, s:mid, s:bot)
let g:airline#themes#jay#palette.visual.airline_warning = s:warn
let g:airline#themes#jay#palette.visual.airline_error = s:err
let g:airline#themes#jay#palette.visual_modified = {'airline_c': s:V2}
let g:airline#themes#jay#palette.visual_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.visual_modified.airline_error = s:err

" Inactive
let g:airline#themes#jay#palette.inactive = airline#themes#generate_color_map(s:inac, s:inac, s:inac)
let g:airline#themes#jay#palette.inactive_modified = {'airline_c': s:N2}

" Tabline
let g:airline#themes#jay#palette.tabline = {
			\ 'airline_tablabel': s:tab,
			\ 'airline_tab': s:bot,
			\ 'airline_tabsel': s:mid,
			\ 'airline_tabmod': s:err,
			\ 'airline_tabhid': s:inac,
			\ 'airline_tab_right': s:bot,
			\ 'airline_tabsel_right': s:mid,
			\ 'airline_tabmod_right': s:err,
			\ 'airline_tabhid_right': s:inac}
