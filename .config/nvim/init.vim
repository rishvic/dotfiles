"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/rishvic/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/rishvic/.config/nvim/dein')
  call dein#begin('/home/rishvic/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/rishvic/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('morhetz/gruvbox')
  call dein#add('vim-airline/vim-airline')
  "call dein#add('HerringtonDarkholme/yats.vim')
  "call dein#add('cespare/vim-toml')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('gootorov/q-sharp.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('bling/vim-bufferline')
  "call dein#add('vim-latex/vim-latex')

  call dein#add('Shougo/defx.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('kristijanhusak/defx-git')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('junegunn/fzf.vim')

  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set re=0
set hidden
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let mapleader=" "
set signcolumn=yes
let g:indentLine_enabled = 0
let g:bufferline_echo = 0

set updatetime=300

if &t_Co >= 256
  set termguicolors
  let g:gruvbox_italic=1
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox

  let g:indentLine_enabled = 1
  let g:indentLine_bufNameExclude = ['FZF']
  let g:indentLine_bufTypeExclude = ['help']
  "let g:indentLine_fileTypeExclude = ['defx', 'json']
  let g:indentLine_fileTypeExclude = ['json', 'markdown', 'yaml', 'csv', 'tex']
  let g:indentLine_char = '┊'

  let g:tex_flavor='latex'

  let g:airline_powerline_fonts = 1
  let g:airline#extensions#hunks#enabled = 1
  let g:airline#extensions#hunks#coc_git = 1

  let $FZF_DEFAULT_OPTS='--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
endif

" defx configuration
call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('multi', ['open_directory', 'change_vim_cwd']) :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'indent:git:icon:icons:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> ,
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> > defx#do_action('resize',
  \ defx#get_context().winwidth + 10)
  nnoremap <silent><buffer><expr> < defx#do_action('resize',
  \ defx#get_context().winwidth - 10)
endfunction

map <silent> <Leader>fT :Defx -columns=indent:git:icon:icons:filename:type -split=vertical -winwidth=50 -direction=botright<CR>
map <silent> <Leader>ft :Defx -toggle -columns=indent:git:icon:icons:filename:type -split=vertical -winwidth=50 -direction=botright<CR>

" Coc.nvim keybindings
" Tab to trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <c-space> to trigger autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" General keybindings
map <Leader>gd <Plug>(coc-definition)
map <Leader>gr <Plug>(coc-references)

" Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" FZF keybindings
map <Leader>sf :Files<CR>
map <Leader>sj :Rg<CR>

" Coc.nvim file formatter keybindings
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

" Terminal configuration
tnoremap <ESC>   <C-\><C-n>
