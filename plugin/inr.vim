if exists('g:loaded_invert_number_row')
    finish
endif

let g:loaded_invert_number_row = 1

if !exists('g:invertmode')
    let g:invertmode = 'i'
endif

let s:keys = [
    \ ['1', '!'],
    \ ['2', '@'],
    \ ['3', '#'],
    \ ['4', '$'],
    \ ['5', '%'],
    \ ['6', '^'],
    \ ['7', '&'],
    \ ['8', '*'],
    \ ['9', '('],
    \ ['0', ')']
    \ ]

let s:modes = {
    \ 'n': 'nnoremap',
    \ 'v': 'vnoremap',
    \ 'x': 'xnoremap',
    \ 's': 'snoremap',
    \ 'o': 'onoremap',
    \ 'i': 'inoremap',
    \ 'l': 'lnoremap',
    \ 'c': 'cnoremap',
    \ 't': 'tnoremap',
    \ }

function! s:invert(mode, orig, modi)
    let commands = []
    let mapmode = get(s:modes, a:mode)
    let [orig_, modi_] = [a:orig, a:modi]
    let i = 0
    while i < 2
        let marg = maparg(modi_, a:mode, 0, 1)
        if empty(marg) || marg['rhs'] == orig_
            call add(commands, printf('%s %s %s', mapmode, orig_, modi_))
        else
            let command = mapmode
            if !get(marg, 'noremap')
                let command = a:mode . 'map'
            endif

            if get(marg, 'silent')
                let command = command . ' <silent>'
            endif

            if get(marg, 'expr')
                let command = command . ' <expr>'
            endif

            let rhs = marg['rhs']
            call add(commands, printf('%s %s %s', command, orig_, rhs))
        endif

        let [orig_, modi_] = [modi_, orig_]
        let i += 1
    endwhile

    for cmd in commands
        execute cmd
    endfor
endfunction

function! s:init()
    for mode in split(g:invertmode, '\zs')
        if has_key(s:modes, mode)
            for [orig, modi] in s:keys
                call s:invert(mode, orig, modi)
            endfor
        endif
    endfor
endfunction

call s:init()
