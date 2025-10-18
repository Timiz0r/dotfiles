## monja
This repo uses [monja](https://github.com/Timiz0r/monja) for managing dotfiles.

To use the dotfiles in this repo:
1. Install monja
2. Clone this repo. The default path is `$XDG_DATA_HOME/monja/repo`, but anywhere works.
3. Create a profile (see below)
4. Run `monja pull`. Keep in mind this can overwrite existing files.

### Profiles
A profile mainly specifies the set of directories found at the root of this repo (called sets).
It lives in `$XDG_CONFIG_HOME/monja/monja-profile.toml`. Sample:

```toml
# this can be an absolute path or a path relative to $HOME
repo-dir = '.local/share/monja/repo'

# these are layered on top of each other. if a file is in multiple sets, the later one wins.
target-sets = [
    'foo',
    'bar',
    'baz',
]
```
