# lc-shell

This project is used to setup a shell with minimal effort. It uses shell scripts to setup Vim, ZSH and tmux configuration.

Now, I choose to use Nix and [home-manager](https://github.com/nix-community/home-manager) to manage these files. I have made a Nix module with a similar setup called [lc-shell-nix](https://github.com/lightcode/lc-shell-nix).


## Installation

Dependencies:

* git
* tmux
* vim
* zsh


To install lc-shell:

```console
$ git clone https://github.com/lightcode/lc-shell.git "${HOME}/.lc-shell"
$ cd "${HOME}/.lc-shell"
$ ./setup.sh
```

You can update lc-shell with the command:

```console
$ update-lc-shell
```


## What lc-shell can do?

### Vim

* <kbd>CTRL</kbd> + <kbd>k</kbd> and <kbd>CTRL</kbd> + <kbd>p</kbd>: enable/disable paste mode and hide/show line number
* <kbd>,</kbd> + <kbd>w</kbd>: write
* <kbd>,</kbd> + <kbd>q</kbd>: quit buffer
* <kbd>CTRL</kbd> + <kbd>p</kbd>: open ctrlp, an extension that allow to open files
* <kbd>,</kbd> + <kbd>Left</kbd>/<kbd>Right</kbd>: change buffer
* <kbd>,</kbd> + <kbd>s</kbd>: strip trailing whitespace (remove white space at the end of lines)

**Note**: in this context, buffers are used like tabs.


### Tmux

* <kbd>ALT</kbd> + <kbd>Up</kbd>/<kbd>Down</kbd>/<kbd>Left</kbd>/<kbd>Right</kbd>: move between panels
* <kbd>ALT</kbd> + <kbd>PageUp</kbd>/<kbd>PageDown</kbd>: change window
* <kbd>ALT</kbd> + <kbd>Space</kbd>: zoom a panel
* <kbd>CTRL</kbd> + <kbd>b</kbd>, <kbd>PageUp</kbd>: scroll the pannel up. Next you can move with <kbd>PageUP</kbd>,
  <kbd>PageDown</kbd> and the arrows. This mode is the copy mode.


### ZSH

Functions:

* `reloadzsh`: reload `.zshrc`, `.zshenv` and run `rehash` (that permit to recreate hash table that contains all functions in PATH. This is usefull for completion)

Shortcuts:

* <kbd>ALT</kbd> + <kbd>g</kbd>: `git status --short`

Usefull aliases:

* `gl`: `git log`
* `gc`: `git commit`


### ZSH customization

To customize ZSH, you can add ZSH files in the `~/.zshrc.d` directory.
