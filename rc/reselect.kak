provide-module reselect %{

declare-option -hidden str reselect_state

map global "normal" "i" ": reselect-i<ret>"
map global "normal" "I" ": reselect-I<ret>"
map global "normal" "a" ": reselect-a<ret>"
map global "normal" "A" ": reselect-A<ret>"

define-command -hidden reselect-i %{
  reselect-remember-selections
  execute-keys -with-hooks "i"
}

define-command -hidden reselect-I %{
  reselect-remember-selections
  execute-keys -with-hooks "I"
}

define-command -hidden reselect-a %{
  execute-keys "L"
  reselect-remember-selections
  hook -once global ModeChange pop:insert:.* %{
    execute-keys "H"
  }
  execute-keys -with-hooks "i"
}

define-command -hidden reselect-A %{
  reselect-remember-selections
  execute-keys -with-hooks "A"
}

define-command -hidden reselect-remember-selections %{
  set-option window reselect_state "%reg{z}"
  execute-keys '"zZ: nop<ret>'
  hook -once global ModeChange pop:insert:.* %{
    execute-keys '"zz: nop<ret>'
    set-register "z" "%opt{reselect_state}"
  }
  execute-keys ";"
}

}