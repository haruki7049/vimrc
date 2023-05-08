set number
syntax on

set autoindent
set smartindent

set smarttab

set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on

if has("autocmd")
  autocmd filetype vim setl tabstop=2 shiftwidth=2 et
  autocmd filetype rust setl tabstop=4 shiftwidth=4 et
endif
