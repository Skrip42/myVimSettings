if exists('g:loaded_syntax_debug')
  finish
endif
let g:loaded_syntax_debug = 1

function! s:TestSyn() abort
let res = ''
for id in synstack(line("."), col("."))
   if res != ''
      let res ..= ' -> '
   endif
   let res ..= synIDattr(id, "name")
endfor
if exists('l:id')
   let res ..= '(' .. synIDattr(synIDtrans(id), "name") .. ')'
endif
echo res
return
endfunction

command! SyntaxStack call s:TestSyn()
