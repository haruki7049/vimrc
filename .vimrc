set number

"Jetpack package manager
packadd vim-jetpack
call jetpack#begin()
"Jetpack bootstarp
Jetpack 'tani/vim-jetpack', {'opt': 1}

"LSP
Jetpack 'shun/ddc-source-vim-lsp'
"Jetpack 'mattn/vim-lsp-settings'
Jetpack 'prabirshrestha/vim-lsp'

"ddc.vim
Jetpack 'Shougo/ddc.vim'
Jetpack 'vim-denops/denops.vim'
Jetpack 'Shougo/ddc-ui-native'
Jetpack 'Shougo/ddc-around'
Jetpack 'Shougo/ddc-filter-matcher_head'
Jetpack 'Shougo/ddc-filter-sorter_rank'

"mocword
Jetpack 'Shougo/ddc-source-mocword'
Jetpack 'high-moctane/mocword'
Jetpack 'high-moctane/mocword-data'

"ddc-ui-pum
Jetpack 'Shougo/ddc-ui-pum'
Jetpack 'Shougo/pum.vim'

"Jetpack 'LumaKernel/ddc-file'
"Jetpack 'Shougo/ddc-converter_remove_overlap'
call jetpack#end()

"LSP settings
if executable('clangd')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'allowlist': ['c'],
    \ })
endif
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rust-analyzer',
    \ 'cmd': {server_info->['rust-analyzer']},
    \ 'allowlist': ['rust'],
    \ })
endif
if executable('haskell-language-server-wrapper')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'haskell-language-server-wrapper',
    \ 'cmd': {server_info->['haskell-language-server-wrapper']},
    \ 'allowlist': ['haskell'],
    \ })
endif

"settings of ddc.vim
call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
  \ 'around': {
  \   'mark': 'around',
  \ },
  \ 'vim-lsp': {
  \   'mark': 'lsp',
  \   'matchers': ['matcher_head'],
  \ },
  \ '_': {
  \   'matchers': ['matcher_head'],
  \   'sorters': ['sorter_rank'],
  \ }})
call ddc#enable()

"settings of pum.vim
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

