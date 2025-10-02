vim9script

import "./src/utils.vim"

set nocompatible

# Ignore denops version check
const g:denops_disable_version_check = 1

# Set dpp base path (required)
const base_path: string = "~/.cache/dpp"

# Source codes
const dpp_src: string = "~/.cache/dpp/repos/github.com/Shougo/dpp.vim"
const denops_src: string = "~/.cache/dpp/repos/github.com/vim-denops/denops.vim"
const dpp_ext_toml_src: string = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
const dpp_ext_lazy_src: string = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy"
const dpp_protocol_git_src: string = "~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"

utils.EnsureRepoExists("https://github.com/Shougo/dpp.vim.git", dpp_src)
utils.EnsureRepoExists("https://github.com/vim-denops/denops.vim.git", denops_src)
utils.EnsureRepoExists("https://github.com/Shougo/dpp-ext-toml.git", dpp_ext_toml_src)
utils.EnsureRepoExists("https://github.com/Shougo/dpp-ext-lazy.git", dpp_ext_lazy_src)
utils.EnsureRepoExists("https://github.com/Shougo/dpp-protocol-git.git", dpp_protocol_git_src)

execute 'set runtimepath^=' .. dpp_ext_toml_src
execute 'set runtimepath^=' .. dpp_ext_lazy_src
execute 'set runtimepath^=' .. dpp_protocol_git_src

# Add dpp.vim source
execute 'set runtimepath^=' .. dpp_src

if base_path->dpp#min#load_state()
  # Add denops.vim source
  execute 'set runtimepath^=' .. denops_src

  const dpp_config: string = expand("~/.config/vim/dpp/config.ts")

  autocmd User DenopsReady
    | echomsg "denops ready"

  autocmd User DenopsReady
    | call dpp#make_state(base_path, "~/.config/vim/dpp/config.ts")
endif

# Add denops.vim source
execute 'set runtimepath^=' .. denops_src

autocmd User Dpp:makeStatePost : echohl WarningMsg
  | echomsg 'dpp make_state() is done'

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
