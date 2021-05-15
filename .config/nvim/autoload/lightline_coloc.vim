" Took all stuff from delphinus/lightline-delphinus, check it out!

scriptencoding utf-8

if $TERM ==# 'linux'
  let s:branch_glyph = ''
else
  let s:branch_glyph = ' '
endif

function! lightline_coloc#hunks() abort
  if !dein#is_sourced('vim-signify') || &filetype =~# 'fzf' || winwidth(0) < 110
    return ''
  endif
  let [added, modified, removed] = sy#repo#get_stats()
  if added == -1
    return ''
  endif
  return printf('+%d -%d ~%d', added, removed, modified)
endfunction

function! lightline_coloc#branch() abort
  if &buftype ==# 'terminal' || winwidth(0) < 90
    return ''
  endif
  if dein#is_sourced('vim-gitbranch')
    let head = gitbranch#name()
    if head !=? ''
      let head = s:branch_glyph . head
    endif
    return head
  endif
  return ''
endfunction
