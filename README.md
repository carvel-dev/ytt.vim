# ytt.vim
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Latest: Release](https://img.shields.io/github/release/cappyzawa/ytt.vim.svg)](https://github.com/cappyzawa/ytt.vim/releases)

vim plugin for [ytt](https://get-ytt.io)

## Install
To install using [Vim-Plug](https://github.com/junegunn/vim-plug):

```
" add this line to your .vimrc file
Plug 'cappyzawa/starlark.vim'
Plug 'cappyzawa/ytt.vim'
```

This plugin requires [cappyzawa/starlark\.vim: vim plugin for starlark](https://github.com/cappyzawa/starlark.vim).

## Supported commands
|Command|Description|
|:---|:---|
|EnableYtt|enable ytt syntax|
|DisableYtt|disable ytt syntax|

## Key mappings
|Map|Key|Command|
|:---:|:---:|:---|
|nmap|<Leader\>ey|EnableYtt|
|nmap|<Leader\>dy|DisableYtt|
