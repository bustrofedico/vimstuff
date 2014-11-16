set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set number
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
" Git bundles
Plugin 'duff/vim-bufonly'
Plugin 'jcf/vim-latex'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'ironcamel/vimchat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kurkale6ka/vim-swap'
Plugin 'tpope/vim-repeat'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
" vim.org bundles
Plugin 'marvim'
Plugin 'python.vim'
Plugin 'php.vim'
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
if &term =~ "xterm"
        let &t_SI = "\<Esc>]12;purple\x7"
        let &t_EI = "\<Esc>]12;blue\x7"
    endif
"for latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
"latex suite compile pdf
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
"
" Don't save backups of *.gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
set viminfo=
"autosave 
" let g:auto_save = 1

augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg --decrypt --default-recipient-self" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg --encrypt --default-recipient-self
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END
map <f8> :w<cr><leader>ll
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
