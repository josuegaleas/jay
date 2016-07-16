# jay
Yet another colorscheme for Vim. Inspired by [Molokai](https://github.com/tomasr/molokai).

## Features
- Same color palette for both terminal and GUI Vim
- Support for 16 color terminals

## Palette
![Palette](./images/palette.png?raw=true)
```
jay      HEX       Vim
------   -------   ---
back0    #121212   233
back     #1c1c1c   234
back2    #262626   235
back3    #444444   238
back4    #606060   241
fore     #dadada   253
fore2    #bcbcbc   250
fore3    #9e9e9e   247
red      #df5f5f   167
orange   #dfaf5f   179
yellow   #dfdf5f   185
green    #5fdf5f    77
aqua     #5fdfdf    80
blue     #5f87df    68
purple   #af5fdf   134
```

## Installation
#### Method 1: Manually
- Copy or move `jay.vim` in `colors/` into your `.vim/colors/` directory
- If your `.vim/colors/` directory does not exist, copy or move `colors/` into your `.vim/` directory
- On Windows, your `.vim/` directory is called `vimfiles` instead

#### Method 2: Vundle (Recommended)
- Add `Plugin 'josuegaleas/jay'` to your `.vimrc` file
- Restart Vim, and then use the command `:PluginInstall` to install the bundle

#### Method 3: Pathogen
Clone this repository into your `.vim/bundles` directory with:
```
git clone https://github.com/josuegaleas/jay.git ~/.vim/bundle/jay/
```
On Windows, your `.vim/` directory is called `vimfiles` instead

#### Updating `.vimrc`
After any of these methods, add the following lines to your `.vimrc` file:
```
syntax enable
colorscheme jay
```

## To Do
- Support for various plugins
- Extended syntax highlighting for various languages
- A light mode option

## References
- [gruvbox](https://github.com/morhetz/gruvbox)
- [Solarized](https://github.com/altercation/vim-colors-solarized)
- [Vimcasts, Episode 25](http://vimcasts.org/episodes/creating-colorschemes-for-vim/)

## Tools Used
- [Xterm Color Table](https://github.com/guns/xterm-color-table.vim)
- [Colorizer](https://github.com/chrisbra/Colorizer)
- [HiLinkTrace](https://github.com/gerw/vim-HiLinkTrace)

## Commands Used
- `:help highlight-groups`
- `:help group-name`
- `:highlight`
- `:source $VIMRUNTIME/syntax/hitest.vim`
