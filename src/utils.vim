vim9script

export def EnsureRepoExists(repo_url: string, dest_path: string)
  if !filereadable(dest_path .. "/.git/config")
    system("git clone " .. repo_url .. " " .. dest_path)
  endif
enddef

export def DppInstallerAction(cmd: string)
  if denops#server#status() == "running"
    call dpp#async_ext_action("installer", cmd)
  else
    echo "denops is not started"
  endif
enddef

export def DppReset(basePath: string)
  echo "Deleting " .. basePath .. " ..."
  system("rm -rf " .. basePath)

  echomsg "Please reboot your Vim..."
enddef
