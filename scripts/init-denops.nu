#!/usr/bin/env nu

const denops_src = ["/Users/haruki", ".cache/dpp/repos/github.com/vim-denops/denops.vim"] | path join;

if not ($denops_src | path exists) {
    git clone https://github.com/vim-denops/denops.vim $denops_src
} else {
    print $"There {($denops_src)} is already cloned 'github.com/vim-denops/denops.vim' repo"
}
