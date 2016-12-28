# jay
Yet another colorscheme for Vim. Inspired by [Molokai](https://github.com/tomasr/molokai).

## Features
- Same color palette for both terminal and GUI Vim
- Light and dark variants
- Matching themes for [Airline](https://github.com/vim-airline/vim-airline) and [Lightline](https://github.com/itchyny/lightline.vim)
- Support for 16 color terminals

## Palette
![Palette (Dark)](./images/palette_Dark.png?raw=true)

![Palette (Light)](./images/palette_Light.png?raw=true)

Tabulated values can be found [here](./palette.md).

## Gallery
Font used in screenshots is [Hack](https://github.com/chrissimpkins/Hack).
#### Airline Theme
![Airline](./images/statusline_Airline_Dark.png?raw=true)

![Airline](./images/statusline_Airline_Light.png?raw=true)

#### Lightline Theme
![Lightline](./images/statusline_Lightline_Dark.png?raw=true)

![Lightline](./images/statusline_Lightline_Light.png?raw=true)

## Installation
### Installing the Colorscheme
**Method 1: Manually**
- Download this repository and unzip the contents
- Copy or move the contents into your `.vim/` directory
	- On Windows, your `.vim/` directory may be called `vimfiles\` instead

**Method 2: Vundle (or similar plugin manager)**
- Add `Plugin 'josuegaleas/jay'` to your `.vimrc` file
- Restart Vim, and then use the command `:PluginInstall` to install the bundle

**Method 3: Pathogen**
- Clone this repository into your `.vim/bundles/` directory with:

	```
	git clone https://github.com/josuegaleas/jay.git ~/.vim/bundle/jay/
	```
	- On Windows, your `.vim/` directory may be called `vimfiles\` instead

### Updating `.vimrc`
#### Dark Variant
Add the following lines to your `.vimrc` file:
```
syntax on
set background=dark
colorscheme jay
```
If you would like the matching theme for Airline, add the following line to your `.vimrc` file:
```
let g:airline_theme='jay'
```
If you would like the matching theme for Lightline, add the following line to your `.vimrc` file:
```
let g:lightline = {'colorscheme': 'jay'}
```

#### Light Variant
Add the following lines to your `.vimrc` file:
```
syntax on
set background=light
colorscheme jay
```
If you would like the matching theme for Airline, add the following line to your `.vimrc` file:
```
let g:airline_theme='jay_light'
```
If you would like the matching theme for Lightline, add the following line to your `.vimrc` file:
```
let g:lightline = {'colorscheme': 'jay_light'}
```

## To Do
- [x] A light mode option
- [ ] Improve light mode option
- [ ] Support for various plugins
- [ ] Support for environments that use italics
- [ ] Improve support for 16 color terminals
- [ ] Support for 8 color terminals

## References
- [gruvbox](https://github.com/morhetz/gruvbox)
- [Solarized](https://github.com/altercation/vim-colors-solarized)
- [Vimcasts, Episode 25](http://vimcasts.org/episodes/creating-colorschemes-for-vim/)

## Tools Used
- [Xterm Color Table](https://github.com/guns/xterm-color-table.vim)
- [Colorizer](https://github.com/chrisbra/Colorizer)
- [HiLinkTrace](https://github.com/gerw/vim-HiLinkTrace)
- `:help highlight-groups`
- `:help group-name`
- `:highlight`
- `:source $VIMRUNTIME/syntax/hitest.vim`
