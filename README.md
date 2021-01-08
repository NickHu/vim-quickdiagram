# vim-quickdiagram

A vim plugin to insert and embed screenshots quickly while writing Markdown or
LaTeX.

## Diagram providers

### remarkable-screenshot.sh

Takes a screenshot from a reMarkable on the same LAN/over USB, with
autocropping. For ease of use, [set up an ssh
key](https://remarkablewiki.com/tech/ssh#setting_up_ssh-keys) (seems like only
RSA keys are supported).

It takes about 15 seconds for the reMarkable 2 to dump its framebuffer, so this
script is ran asynchronously on neovim.

TODO: support reMarkable 1

### screenshot and crop with scrot

```vim
let g:quickdiagram_command="scrot -s -o /dev/stdout | convert - -trim "
```
