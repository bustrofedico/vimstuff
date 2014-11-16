set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set number
" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'
" Git bundles
Bundle 'duff/vim-bufonly'
Bundle 'jcf/vim-latex'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'ironcamel/vimchat'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kurkale6ka/vim-swap'
Bundle 'tpope/vim-repeat'
" vim.org bundles
Bundle 'marvim'
Bundle 'python.vim'
Bundle 'php.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()

colorscheme desert256v2
set hlsearch
set number
syntax enable
" config for vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" 
set statusline+=%{fugitive#statusline()}
