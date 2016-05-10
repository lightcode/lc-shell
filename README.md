Installation
============

Dependencies :

* git
* tmux
* vim
* zsh


To install lc-shell :

```console
$ git clone https://github.com/lightcode/lc-shell.git "${HOME}/.lc-shell"
$ cd "${HOME}/.lc-shell"
$ ./setup.sh
```

You can update lc-shell with the command :

```console
$ update-lc-shell
```


What lc-shell do?
=================

Vim
---

*Note*: buffer is like tabs in this context.

* <kbd>CTRL</kbd> + <kbd>k</kbd> and <kbd>CTRL</kbd> + <kbd>p</kbd> : enable/disable paste mode and hide/show line number
* <kbd>,</kbd> + <kbd>w</kbd> : write
* <kbd>,</kbd> + <kbd>q</kbd> : quit buffer
* <kbd>CTRL</kbd> + <kbd>p</kbd> (insert mode) : open ctrlp, an extension that allow to open files
* <kbd>,</kbd> + <kbd>Left</kbd>/<kbd>Right</kbd> : change buffer
* <kbd>,</kbd> + <kbd>s</kbd> : strip trailing whitespace (remove white space at the end of lines)


Tmux
----

* <kbd>ALT</kbd> + <kbd>Up</kbd>/<kbd>Down</kbd>/<kbd>Left</kbd>/<kbd>Right</kbd> : move between panels
* <kbd>ALT</kbd> + <kbd>PageUp</kbd>/<kbd>PageDown</kbd> : change window
* <kbd>ALT</kbd> + <kbd>Space</kbd> : zoom a panel
* <kbd>CTRL</kbd> + <kbd>b</kbd>, <kbd>PageUp</kbd> : scroll the pannel up. Next you can move with <kbd>PageUP</kbd>,
  <kbd>PageDown</kbd> and the arrows. This mode is the copy mode.


ZSH
---

Functions :

* `reloadzsh` : reload `.zshrc`, `.zshenv` and run `rehash` (that permit to
  recreate hash table that contains all functions in PATH. This is usefull for completion)

Shortcuts :

* <kbd>ALT</kbd> + <kbd>g</kbd> : `git status --short`

Usefull aliases :

* `gl` : `git log`
* `gc` : `git commit`


ZSH Customization
=================

To customize ZSH, you can add ZSH files in the `~/.zshrc.d` directory. Your scripts will
be sourced after Zprezto.

For customize Zprezto options, you can override default options by creating a `~/.zpreztorc`
file.
