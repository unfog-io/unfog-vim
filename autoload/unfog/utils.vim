" ------------------------------------------------------------------ # Compose #

function! unfog#utils#compose(...)
  let funcs = map(reverse(copy(a:000)), 'function(v:val)')
  return function('s:compose', [funcs])
endfunction

function! s:compose(funcs, arg)
  let data = a:arg

  for Func in a:funcs
    let data = Func(data)
  endfor

  return data
endfunction

" --------------------------------------------------------------------- # Trim #

function! unfog#utils#trim(str)
  return unfog#utils#compose('s:trim_left', 's:trim_right')(a:str)
endfunction

function! s:trim_left(str)
  return substitute(a:str, '^\s*', '', 'g')
endfunction

function! s:trim_right(str)
  return substitute(a:str, '\s*$', '', 'g')
endfunction

" ------------------------------------------------------------------- # Assign #

function! unfog#utils#assign(...)
  let overrides = copy(a:000)
  let base = remove(overrides, 0)

  for override in overrides
    for [key, val] in items(override)
      let base[key] = val
      unlet key val
    endfor
  endfor

  return base
endfunction

" ---------------------------------------------------------------------- # Sum #

function! unfog#utils#sum(array)
  let total = 0

  for item in a:array
    let total += item
  endfor

  return total
endfunction

" ----------------------------------------------------------- # Match one item #

function! unfog#utils#match_one(list_src, list_dest)
  if empty(a:list_dest)
    return 1
  endif

  for item in a:list_src
    if index(a:list_dest, item) > -1 | return 1 | endif
  endfor

  return 0
endfunction


" --------------------------------------------------------------------- # Logs #

function! unfog#utils#log(msg)
  echohl None
  echom 'unfog: ' . a:msg
endfunction


function! unfog#utils#elog(msg)
  redraw
  echohl ErrorMsg
  echom 'unfog: ' . a:msg
  echohl None
endfunction
