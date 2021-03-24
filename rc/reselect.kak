provide-module reselect %{

declare-option -hidden str reselect_state

define-command \
-docstring "reselect-a: Special case for the 'a' key" \
reselect-a %{
  execute-keys "L"
  reselect
  execute-keys ";"
  hook -once global ModeChange pop:insert:.* %{
    execute-keys "H"
  }
  execute-keys -with-hooks "i"
}

define-command \
-docstring "reselect: Remember selections, and restore them upon leaving insert mode" \
reselect %{
  set-option window reselect_state "%reg{z}"
  execute-keys '"zZ: nop<ret>'
  hook -once global ModeChange pop:insert:.* %{
    execute-keys '"zz: nop<ret>'
    set-register "z" "%opt{reselect_state}"
  }
}

}
