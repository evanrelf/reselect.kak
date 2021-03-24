provide-module reselect %{

declare-option -hidden str reselect_state

map global "normal" "i" ": reselect<ret>i"
map global "normal" "I" ": reselect<ret>I"
map global "normal" "a" ": reselect-a<ret>"
map global "normal" "A" ": reselect<ret>A"

define-command -hidden reselect-a %{
  execute-keys "L"
  reselect
  hook -once global ModeChange pop:insert:.* %{
    execute-keys "H"
  }
  execute-keys -with-hooks "i"
}

define-command -hidden reselect %{
  set-option window reselect_state "%reg{z}"
  execute-keys '"zZ: nop<ret>'
  hook -once global ModeChange pop:insert:.* %{
    execute-keys '"zz: nop<ret>'
    set-register "z" "%opt{reselect_state}"
  }
  execute-keys ";"
}

}
