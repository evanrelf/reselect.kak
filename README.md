# reselect.kak

Clear selections when entering insert mode, and restore them when leaving insert
mode.

This avoids the confusion when a cursor jumps to the other end of a selection
when it's facing a certain direction. For example, if you have a word selected,
and your cursor is facing forwards (it's at the end of the word), typing
<kbd>i</kbd> makes your cursor jump to the beginning of the selected word.

This plugin builds on these simple mappings, which solve the confusion but do
not restore the selections:

```kakoune
map global "normal" "i" ";i"
map global "normal" "a" ";li"
```

## Installation

### Using [plug.kak](https://github.com/andreyorst/plug.kak) (recommended)

With plug.kak installed, add to your `kakrc` file:

```kakoune
plug "evanrelf/reselect.kak" config %{
  # Load plugin (required)
  require-module "reselect"

  # Set up core mappings (strongly recommended)
  map global "normal" "i" ": reselect<ret>;i"
  map global "normal" "a" ": reselect-a<ret>"

  # Set up extra mappings (optional)
  map global "normal" "I" ": reselect<ret>;I"
  map global "normal" "A" ": reselect<ret>;A"
  map global "normal" "o" ": reselect<ret>;o"
  map global "normal" "O" ": reselect<ret>;O"
  # etc. (these are just examples; you can create your own!)
}
```

### Manually

Download plugin:

```bash
$ curl -L https://raw.githubusercontent.com/evanrelf/reselect.kak/main/rc/reselect.kak -o ~/.config/kak/plugins/reselect.kak --create-dirs
```

Add to your `kakrc` file:

```kakoune
source ~/.config/kak/plugins/reselect.kak

# Load plugin (required)
require-module "reselect"

# Set up core mappings (strongly recommended)
map global "normal" "i" ": reselect<ret>;i"
map global "normal" "a" ": reselect-a<ret>"

# Set up extra mappings (optional)
map global "normal" "I" ": reselect<ret>;I"
map global "normal" "A" ": reselect<ret>;A"
map global "normal" "o" ": reselect<ret>;o"
map global "normal" "O" ": reselect<ret>;O"
```

## Troubleshooting

This plugin depends on remapping keys, which means it may conflict with your own
personal mappings, or mappings provided by a plugin.

For example,
[alexherbo2/auto-pairs.kak](https://github.com/alexherbo2/auto-pairs.kak)
remaps <kbd>i</kbd>, <kbd>a</kbd>, etc.
