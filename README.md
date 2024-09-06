# zsh-nvm-deferred

Deferred loading of the oh-my-zsh plugin for `nvm`, using [zsh-defer](https://github.com/romkatv/zsh-defer), and loading of the current version based from `.nvmrc`. This speeds up shell startup time while still making sure that `nvm` is loaded when needed.

## Installation with zgen

```
# ...
if ! zgen saved; then
    zgen oh-my-zsh
    zgen load romkatv/zsh-defer
    zgen load davidparsson/zsh-nvm-deferred

    zgen save
fi
```
