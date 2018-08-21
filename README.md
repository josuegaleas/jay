# jay
Yet another Vim colorscheme on GitHub. Inspired by [Molokai](https://github.com/tomasr/molokai).

## Features
- Same color palette for both terminal and GUI Vim
- Light and dark modes, with a transparent option
- Matching themes for [Airline](https://github.com/vim-airline/vim-airline) and [Lightline](https://github.com/itchyny/lightline.vim)
- Support for 256, 16, and 8 color terminals
- Explicitly supported plugins: None so far!
	- Want a certain plugin themed? Feel free to open an issue!

# Gallery
Font used in screenshots is [Hack](https://github.com/source-foundry/Hack). Additional syntax highlighting done by [vim-polyglot](https://github.com/sheerun/vim-polyglot).

For more examples in different languages, visit 'jay' on [colorswat.ch](http://colorswat.ch/vim/schemes/jay).

## Dark Mode
![Dark Mode](https://raw.githubusercontent.com/josuegaleas/jay-images/master/sample_Dark.png?raw=true)

## Light Mode
![Light Mode](https://raw.githubusercontent.com/josuegaleas/jay-images/master/sample_Light.png?raw=true)

## Airline Theme
![Airline (Dark)](https://raw.githubusercontent.com/josuegaleas/jay-images/master/statusline_Airline_Dark.png?raw=true)

![Airline (Light)](https://raw.githubusercontent.com/josuegaleas/jay-images/master/statusline_Airline_Light.png?raw=true)

## Lightline Theme
![Lightline (Dark)](https://raw.githubusercontent.com/josuegaleas/jay-images/master/statusline_Lightline_Dark.png?raw=true)

![Lightline (Light)](https://raw.githubusercontent.com/josuegaleas/jay-images/master/statusline_Lightline_Light.png?raw=true)

## Palette
Tabulated values can be found [here](./PALETTE.md).

![Palette (Dark)](https://raw.githubusercontent.com/josuegaleas/jay-images/master/palette_Dark.png?raw=true)

![Palette (Light)](https://raw.githubusercontent.com/josuegaleas/jay-images/master/palette_Light.png?raw=true)

# Installation
## 1) Installing the Theme
### Manually
- Download this repository and unzip its contents
- Copy or move the contents into your `.vim` directory (possibly `vimfiles` on Windows)

### [vim-plug](https://github.com/junegunn/vim-plug) (or similar plugin manager)
- Add `Plug 'josuegaleas/jay'` to your `.vimrc` file
- Restart Vim and use `:PlugInstall` to install

### [pathogen.vim](https://github.com/tpope/vim-pathogen)
Clone this repository into your `.vim/bundle` directory (possibly `vimfiles\bundle` on Windows) with:
```bash
git clone --depth=1 https://github.com/josuegaleas/jay.git ~/.vim/bundle/jay/
```

## 2) Updating `.vimrc`
### Dark Mode
Add the following lines to your `.vimrc` file:
```viml
syntax enable
set background=dark
colorscheme jay
```

### Light Mode
Add the following lines to your `.vimrc` file:
```viml
syntax enable
set background=light
colorscheme jay
```

### Transparent Option
Add the following line anywhere **before** `colorscheme jay` to your `.vimrc` file:
```viml
let jay_transparent=1
```

### Matching Airline/Lightline Theme
Airline *should* detect your configuration without further instruction.

For Lightline, add the following line anywhere **after** `colorscheme jay` to your `.vimrc` file:
```viml
let g:lightline = {'colorscheme': 'jay'}
```
Lightline *should* detect your configuration after the above line is added.

# TODO
- [ ] Find a better solution to issue [#4](https://github.com/josuegaleas/jay/issues/4)
- [ ] Add explicit support for various plugins
- [ ] Add support for environments that use italics

# References
- [gruvbox](https://github.com/morhetz/gruvbox)
- [Solarized](https://github.com/altercation/vim-colors-solarized)
- [Vimcasts, Episode 25](http://vimcasts.org/episodes/creating-colorschemes-for-vim/)

# Tools
- [Xterm Color Table](https://github.com/guns/xterm-color-table.vim)
- [Colorizer](https://github.com/chrisbra/Colorizer)
- [HiLinkTrace](https://github.com/gerw/vim-HiLinkTrace)
- `:help highlight-groups`
- `:help group-name`
- `:highlight`
- `:source $VIMRUNTIME/syntax/hitest.vim`

# Credit
- [FliiFe](https://github.com/FliiFe) for motivating me to make the transparent option.
- [ksergey](https://github.com/ksergey) for motivating me to improve the tabline of the Airline and Lightline themes.
