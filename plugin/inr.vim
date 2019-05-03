if exists('g:loaded_invert_number_row')
    finish
endif

let g:loaded_invert_number_row = 1

if !exists('g:invertmode')
    let g:invertmode = 'i'
endif

function! s:init()
    let l:keys = [
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

    let l:modes = [
        \ ['n', 'nnoremap'],
        \ ['v', 'vnoremap'],
        \ ['x', 'xnoremap'],
        \ ['s', 'snoremap'],
        \ ['o', 'onoremap'],
        \ ['i', 'inoremap'],
        \ ['l', 'lnoremap'],
        \ ['c', 'cnoremap'],
        \ ['t', 'tnoremap'],
        \ ]

    for [mode, command] in l:modes
        if match(g:invertmode, mode) != -1
            for [orig, modi] in l:keys
                execute printf('%s %s %s', command, orig, modi)
                execute printf('%s %s %s', command, modi, orig)
            endfor
        endif
    endfor
endfunction

call s:init()
