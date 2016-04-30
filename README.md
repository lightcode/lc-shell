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


ZSH Customization
=================

For customize ZSH, you can add ZSH files in the `~/.zshrc.d` directory. Your scripts will
be sourced after Zprezto.

For customize Zprezto options, you can override default options by creating a `~/.zpreztorc`
file.
