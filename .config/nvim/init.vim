"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/rishvic/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/rishvic/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('/home/rishvic/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

call dein#add('morhetz/gruvbox')
call dein#add('itchyny/lightline.vim')

call dein#add('sheerun/vim-polyglot')
call dein#add('Yggdroot/indentLine')
call dein#add('mhinz/vim-signify')
call dein#add('itchyny/vim-gitbranch')

call dein#add('junegunn/fzf.vim')
call dein#add('neovim/nvim-lspconfig')
"call dein#add('nvim-lua/completion-nvim')
call dein#add('hrsh7th/nvim-compe')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set re=0
set number
set hidden
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
let mapleader=" "
set signcolumn=yes

set updatetime=100

if $TERM !=# 'linux'
  set termguicolors
  let g:gruvbox_italic = 1
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox

  let g:indentLine_enabled = 1
  let g:indentLine_bufNameExclude = ['FZF']
  let g:indentLine_bufTypeExclude = ['help']
  "let g:indentLine_fileTypeExclude = ['defx', 'json']
  let g:indentLine_fileTypeExclude = ['json', 'markdown', 'yaml', 'csv', 'tex']

  let $FZF_DEFAULT_OPTS = '--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
endif

" FZF keybindings
nnoremap <silent> <Leader>sf :Files<CR>
nnoremap <silent> <Leader>sj :Rg<CR>
nnoremap <silent> <Leader>sb :Buffers<CR>

" nvim lsp format command
command! -nargs=0 Format :lua vim.lsp.buf.formatting(nil)<CR>
nnoremap <silent> <Leader>bf :lua vim.lsp.buf.formatting(nil)<CR>
nnoremap <silent> <Leader>gd :lua vim.lsp.buf.definition()<CR>

runtime config/*.vim

" nvim-compe settings
set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
  \ 'path': v:true,
  \ 'buffer': v:true,
  \ 'nvim_lsp': v:true,
  \ }

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local lspconfig = require'lspconfig'

lspconfig.clangd.setup{}
lspconfig.tsserver.setup{}
lspconfig.html.setup{}
lspconfig.rust_analyzer.setup{}
EOF
