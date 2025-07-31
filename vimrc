vim9script

set number
syntax on

set textwidth=0
set autoindent
set smartindent
set smarttab
filetype plugin on
filetype plugin indent on

set tabstop=4 shiftwidth=4 expandtab

if has("autocmd")
  autocmd filetype vim setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd filetype haskell setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd filetype typescript setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd filetype html setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd filetype go setlocal tabstop=8 shiftwidth=8 noexpandtab

  # Google java style
  autocmd filetype java setlocal tabstop=2 shiftwidth=2 expandtab
endif
