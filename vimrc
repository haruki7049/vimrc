vim9script

set nocompatible

# Ignore denops version check
const g:denops_disable_version_check = 1

# Set dpp base path (required)
const dpp_base: string = "~/.cache/dpp/"

# Set dpp source path (required)
# NOTE: The plugins must be cloned before
const dpp_src: string = "~/.cache/dpp/repos/github.com/Shougo/dpp.vim"
const denops_src: string = "~/.cache/dpp/repos/github.com/vim-denops/denops.vim"

execute 'set runtimepath^=' .. dpp_src

if dpp_base->dpp#min#load_state()
  # NOTE: dpp#make_state() requires denops.vim
  # NOTE: denops.vim and dpp plugins are must be added
  execute 'set runtimepath^=' .. denops_src

  const dpp_config: string = "~/.config/vim/dpp/config.ts"

  autocmd User DenopsReady : echohl WarningMsg | echomsg 'dpp load_state() is failed' | echohl NONE | call dpp#make_state(dpp_base, dpp_config)
endif

autocmd User Dpp:makeStatePost : echohl WarningMsg | echomsg 'dpp make_state() is done' | echohl NONE

############################################################

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
