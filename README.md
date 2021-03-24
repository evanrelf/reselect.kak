# reselect.kak

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
