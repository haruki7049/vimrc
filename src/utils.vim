vim9script

export def EnsureRepoExists(repo_url: string, dest_path: string)
  if !filereadable(dest_path .. "/.git/config")
    system("git clone " .. repo_url .. " " .. dest_path)
  endif
enddef

