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

" Helper Function:
function! s:HF(fg, bg, ...)
	return [a:fg[0], a:bg[0], a:fg[1], a:bg[1], get(a:, 1, 'NONE')]
endfunction

if s:transparent == 0
	let s:mid = s:HF(s:fore2, s:back3)
	let s:bot = s:HF(s:fore3, s:back2)

	let s:N_top = s:HF(s:back2, s:back4)
	let s:I_top = s:HF(s:back2, s:green)
	let s:R_top = s:HF(s:back2, s:purple)
	let s:V_top = s:HF(s:back2, s:blue)

	let s:N_mod = s:HF(s:red, s:back2)
	let s:I_mod = s:HF(s:green, s:back2)
	let s:R_mod = s:HF(s:purple, s:back2)
	let s:V_mod = s:HF(s:blue, s:back2)

	let s:inac = s:HF(s:back3, s:back2)
	let s:warn = s:HF(s:back2, s:orange, 'bold')
	let s:err = s:HF(s:back2, s:red, 'bold')
	let s:tab = s:HF(s:back2, s:back4, 'bold')
else
	if get(g:, 'airline_powerline_fonts', 0)
		let g:airline_left_sep=''
		let g:airline_right_sep=''
	else
		let g:airline_left_sep='|'
		let g:airline_right_sep='|'
	endif

	let s:mid = s:HF(s:fore2, s:none)
	let s:bot = s:HF(s:fore3, s:none)

	let s:N_top = s:HF(s:fore, s:none)
	let s:I_top = s:HF(s:green, s:none)
	let s:R_top = s:HF(s:purple, s:none)
	let s:V_top = s:HF(s:blue, s:none)

	let s:N_mod = s:HF(s:red, s:none)
	let s:I_mod = s:HF(s:green, s:none)
	let s:R_mod = s:HF(s:purple, s:none)
	let s:V_mod = s:HF(s:blue, s:none)

	let s:inac = s:HF(s:back3, s:none)
	let s:warn = s:HF(s:orange, s:none, 'bold')
	let s:err = s:HF(s:red, s:none, 'bold')
	let s:tab = s:HF(s:fore, s:none, 'bold')
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
let g:airline#themes#jay#palette.normal = airline#themes#generate_color_map(s:N_top, s:mid, s:bot)
let g:airline#themes#jay#palette.normal.airline_warning = s:warn
let g:airline#themes#jay#palette.normal.airline_error = s:err
let g:airline#themes#jay#palette.normal.airline_term = s:I_mod
let g:airline#themes#jay#palette.normal_modified = {'airline_c': s:N_mod}
let g:airline#themes#jay#palette.normal_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.normal_modified.airline_error = s:err
let g:airline#themes#jay#palette.normal_modified.airline_term = s:I_mod

" Insert
let g:airline#themes#jay#palette.insert = airline#themes#generate_color_map(s:I_top, s:mid, s:bot)
let g:airline#themes#jay#palette.insert.airline_warning = s:warn
let g:airline#themes#jay#palette.insert.airline_error = s:err
let g:airline#themes#jay#palette.insert_modified = {'airline_c': s:I_mod}
let g:airline#themes#jay#palette.insert_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.insert_modified.airline_error = s:err

" Replace
let g:airline#themes#jay#palette.replace = airline#themes#generate_color_map(s:R_top, s:mid, s:bot)
let g:airline#themes#jay#palette.replace.airline_warning = s:warn
let g:airline#themes#jay#palette.replace.airline_error = s:err
let g:airline#themes#jay#palette.replace_modified = {'airline_c': s:R_mod}
let g:airline#themes#jay#palette.replace_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.replace_modified.airline_error = s:err

" Visual
let g:airline#themes#jay#palette.visual = airline#themes#generate_color_map(s:V_top, s:mid, s:bot)
let g:airline#themes#jay#palette.visual.airline_warning = s:warn
let g:airline#themes#jay#palette.visual.airline_error = s:err
let g:airline#themes#jay#palette.visual.airline_term = s:I_mod
let g:airline#themes#jay#palette.visual_modified = {'airline_c': s:V_mod}
let g:airline#themes#jay#palette.visual_modified.airline_warning = s:warn
let g:airline#themes#jay#palette.visual_modified.airline_error = s:err
let g:airline#themes#jay#palette.visual_modified.airline_term = s:I_mod

" Inactive
let g:airline#themes#jay#palette.inactive = airline#themes#generate_color_map(s:inac, s:inac, s:inac)
let g:airline#themes#jay#palette.inactive.airline_term = s:inac
let g:airline#themes#jay#palette.inactive_modified = {'airline_c': s:N_mod}
let g:airline#themes#jay#palette.inactive_modified.airline_term = s:inac

" Tabline
let g:airline#themes#jay#palette.tabline = {
			\ 'airline_tablabel': s:tab,
			\ 'airline_tab': s:bot,
			\ 'airline_tabsel': (s:transparent == 1 ? s:HF(s:fore2, s:none, 'underline') : s:mid),
			\ 'airline_tabmod': (s:transparent == 1 ? s:HF(s:red, s:none, 'underline') : s:err),
			\ 'airline_tabhid': s:inac,
			\ 'airline_tab_right': s:bot,
			\ 'airline_tabsel_right': (s:transparent == 1 ? s:HF(s:fore2, s:none, 'underline') : s:mid),
			\ 'airline_tabmod_right': (s:transparent == 1 ? s:HF(s:red, s:none, 'underline') : s:err),
			\ 'airline_tabhid_right': s:inac}
