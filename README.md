# jay
Yet another colorscheme for Vim. Inspired by [Molokai](https://github.com/tomasr/molokai).

## Features
- Same color palette for both terminal and GUI Vim
- Light and dark variants
- Matching themes for [Airline](https://github.com/vim-airline/vim-airline) and [Lightline](https://github.com/itchyny/lightline.vim)
- Matching theme for macOS's Terminal
- Support for 16 color terminals

## Palette
![Palette (Dark)](./images/palette_Dark.png?raw=true)

![Palette (Light)](./images/palette_Light.png?raw=true)

Tabulated values can be found [here](./palette.md).

## Gallery
Font used in screenshots is [Hack](https://github.com/chrissimpkins/Hack).
### Airline Theme
![Airline](./images/statusline_Airline_Dark.png?raw=true)

![Airline](./images/statusline_Airline_Light.png?raw=true)

### Lightline Theme
![Lightline](./images/statusline_Lightline_Dark.png?raw=true)

![Lightline](./images/statusline_Lightline_Light.png?raw=true)

# Installation
## Installing the Colorscheme
### Manually
- Download this repository and unzip the contents
- Copy or move the contents into your `.vim/` directory
	- On Windows, your `.vim/` directory may be called `vimfiles\` instead

### Vundle (or Similar Plugin Managers)
- Add `Plugin 'josuegaleas/jay'` to your `.vimrc` file
- Restart Vim, and then use the command `:PluginInstall` to install the bundle

### Pathogen
- Clone this repository into your `.vim/bundles/` directory with:

	```
	git clone https://github.com/josuegaleas/jay.git ~/.vim/bundle/jay/
	```
	- On Windows, your `.vim/` directory may be called `vimfiles\` instead

## Updating `.vimrc`
### Dark Variant
Add the following lines to your `.vimrc` file:
```
syntax on
set background=dark
colorscheme jay
```
For the matching Airline theme, add the following line to your `.vimrc` file:
```
let g:airline_theme='jay'
```
For the matching Lightline theme, add the following line to your `.vimrc` file:
```
let g:lightline = {'colorscheme': 'jay'}
```

### Light Variant
Add the following lines to your `.vimrc` file:
```
syntax on
set background=light
colorscheme jay
```
For the matching Airline theme, add the following line to your `.vimrc` file:
```
let g:airline_theme='jay_light'
```
For the matching Lightline theme, add the following line to your `.vimrc` file:
```
let g:lightline = {'colorscheme': 'jay_light'}
```

## To Do
- [ ] Add code samples to the gallery
- [ ] Improve light mode option
- [ ] Add explicit support for various plugins
- [ ] Add support for environments that use italics
- [ ] Make more matching themes for different environments
- [ ] Improve support for 16 color terminals
- [ ] Add support for 8 color terminals

## References
- [gruvbox](https://github.com/morhetz/gruvbox)
- [Solarized](https://github.com/altercation/vim-colors-solarized)
- [Vimcasts, Episode 25](http://vimcasts.org/episodes/creating-colorschemes-for-vim/)

## Tools
- [Xterm Color Table](https://github.com/guns/xterm-color-table.vim)
- [Colorizer](https://github.com/chrisbra/Colorizer)
- [HiLinkTrace](https://github.com/gerw/vim-HiLinkTrace)
- `:help highlight-groups`
- `:help group-name`
- `:highlight`
- `:source $VIMRUNTIME/syntax/hitest.vim`
