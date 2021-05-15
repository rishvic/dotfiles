" Took most stuff from lightline-delphinus plugin. Check it out!
scriptencoding utf-8

if $TERM ==# 'linux'
  let g:lightline = {
        \ 'colorscheme': '16color',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'githunks', 'gitbranch'],
        \             [ 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'lightline_coloc#branch',
        \   'githunks': 'lightline_coloc#hunks'
        \ }
        \ }
else
  let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'githunks', 'gitbranch'],
        \             [ 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'lightline_coloc#branch',
        \   'githunks': 'lightline_coloc#hunks'
        \ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
        \ }
endif
