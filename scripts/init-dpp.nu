#!/usr/bin/env nu

const dpp_src = ["/Users/haruki", ".cache/dpp/repos/github.com/Shougo/dpp.vim"] | path join;

if not ($dpp_src | path exists) {
    git clone https://github.com/Shougo/dpp.vim $dpp_src
} else {
    print $"There {($dpp_src)} is already cloned 'github.com/Shougo/dpp.vim' repo"
}
