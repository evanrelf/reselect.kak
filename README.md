# reselect.kak

Clear selections when entering insert mode (with <kbd>i</kbd>, <kbd>I</kbd>,
<kbd>a</kbd>, or <kbd>A</kbd>), and restore them when leaving insert mode.

This avoids the confusion when a cursor jumps to the other end of a selection
when it's facing a certain direction. For example, if you have a word selected,
and your cursor is facing forwards (it's at the end of the word), typing
<kbd>i</kbd> makes your cursor jump to the beginning of the selected word.

This plugin builds on these simple mappings, which solve the confusion but do
not restore the selections:

```
map global "normal" "i" ";i"
map global "normal" "a" ";li"
```

## Installation

### Using [plug.kak](https://github.com/andreyorst/plug.kak) (recommended)

With plug.kak installed, add to your `kakrc` file:

```kakoune
plug "evanrelf/reselect.kak" config %{
  require-module "reselect"
}
```

### Manually

Download plugin:

```bash
$ mkdir -p ~/.config/kak/plugins/
$ curl -L https://raw.githubusercontent.com/evanrelf/reselect.kak/main/rc/reselect.kak -o ~/.config/kak/plugins/reselect.kak
```

Add to your `kakrc` file:

```kakoune
source ~/.config/kak/plugins/reselect.kak
require-module "reselect"
```

## Usage

Use <kbd>i</kbd>, <kbd>I</kbd>, <kbd>a</kbd>, and <kbd>A</kbd> normally. Your
cursor will stay put, and your selections will be restored upon leaving insert
mode.

## Troubleshooting

This plugin depends on remapping the <kbd>i</kbd>, <kbd>I</kbd>, <kbd>a</kbd>,
and <kbd>A</kbd> keys.

If you are remapping these keys in your configuration, or use a plugin which
remaps these keys (e.g.
[alexherbo2/auto-pairs.kak](https://github.com/alexherbo2/auto-pairs.kak))
you may have compatibility issues. I recommend removing those mappings and
plugins, or not using this plugin.
