# vim-invert-number-row

Simple script to invert number row key.

Normally typing a symbol requires a number row key combined with <kbd>shift</kbd>, making symbols to take more effort to type.
In programming, symbols are likely used more often than numbers.
This plugin simply inverts the rule so <kbd>shift</kbd> is not required to type symbols.


### Configuring

It only applies to insert mode by default. You can enable it for different mode as you like.

```
" Enable for insert mode and command mode
let g:invertmode = 'ic'
```

`'n'`: Normal mode<br>
`'v'`: Visual mode<br>
`'x'`: Visual mode<br>
`'s'`: Select mode<br>
`'o'`: Operator-pending mode<br>
`'i'`: Insert mode<br>
`'l'`: Language mode<br>
`'c'`: Command line mode<br>
`'t'`: Terminal mode<br>
