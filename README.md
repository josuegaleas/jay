![Palette (Dark)](./images/banner.png?raw=true)

# Features
- Same color palette for both terminal and GUI Vim
- Light and dark modes with transparent option
- Matching themes for [Airline](https://github.com/vim-airline/vim-airline) and [Lightline](https://github.com/itchyny/lightline.vim)
- Support for 16 color terminals

# Gallery
Font used in screenshots is [Hack](https://github.com/chrissimpkins/Hack).

## Dark Mode
![Dark Mode](./images/sample_Dark.png?raw=true)

## Light Mode
![Light Mode](./images/sample_Light.png?raw=true)

## Airline Theme
![Airline (Dark)](./images/statusline_Airline_Dark.png?raw=true)

![Airline (Light)](./images/statusline_Airline_Light.png?raw=true)

## Lightline Theme
![Lightline (Dark)](./images/statusline_Lightline_Dark.png?raw=true)

![Lightline (Light)](./images/statusline_Lightline_Light.png?raw=true)

## Palette
![Palette (Dark)](./images/palette_Dark.png?raw=true)

![Palette (Light)](./images/palette_Light.png?raw=true)

Tabulated values can be found [here](./PALETTE.md).

# Installation
## 1. Installing the Bundle
### Manually
- Download this repository and unzip its contents
- Copy or move the contents into your `.vim/` directory (`vimfiles\` on Windows)

### [vim-plug](https://github.com/junegunn/vim-plug) (or similar plugin manager)
- Add `Plug 'josuegaleas/jay'` to your `.vimrc` file
- Restart Vim and use `:PlugInstall` to install

### [pathogen.vim](https://github.com/tpope/vim-pathogen)
- Clone this repository into your `.vim/bundles/` directory (`vimfiles\bundles\` on Windows) with:
	```Shell
	git clone https://github.com/josuegaleas/jay.git ~/.vim/bundle/jay/
	```

## 2. Updating `.vimrc`
### Dark Mode
Add the following lines to your `.vimrc` file:
```Vim script
syntax enable
set background=dark
colorscheme jay
```

### Light Mode
Add the following lines to your `.vimrc` file:
```Vim script
syntax enable
set background=light
colorscheme jay
```

### Transparent Option
Add the following line anywhere **before** `colorscheme jay` to your `.vimrc` file:
```Vim script
let jay_transparent=1
```

### Matching Statusline Theme
Airline *should* detect your configuration without further instruction.

For Lightline, add the following line anywhere **after** `colorscheme jay` to your `.vimrc` file:
```Vim script
let g:lightline = {'colorscheme': 'jay'}
```
Lightline *should* detect your configuration after the above line is added.

## To Do
- [ ] Add more code samples to the gallery
- [ ] Add explicit support for various plugins
- [ ] Add support for environments that use italics
- [ ] Improve support for 16 color terminals
- [ ] Add support for 8 color terminals

## References
- [Molokai](https://github.com/tomasr/molokai)
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

## Credit
- [FliiFe](https://github.com/FliiFe) for motivating me to make the transparent option.
