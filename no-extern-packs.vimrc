set number
syntax on

set autoindent
set smartindent

set smarttab

filetype plugin indent on

if has("autocmd")
  autocmd filetype vim setl tabstop=2 shiftwidth=2 et
  autocmd filetype c setl tabstop=4 shiftwidth=4 et
  autocmd filetype java setl tabstop=4 shiftwidth=4 et
  autocmd filetype html setl tabstop=4 shiftwidth=4 et
  autocmd filetype sh setl tabstop=4 shiftwidth=4 et
  autocmd filetype lua setl tabstop=4 shiftwidth=4 et
  autocmd filetype rust setl tabstop=4 shiftwidth=4 et
  autocmd filetype haskell setl tabstop=2 shiftwidth=2 et
endif
