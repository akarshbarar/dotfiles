:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'zchee/deoplete-jedi'
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
call plug#end()


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>
:set completeopt-=preview " For No Previews

let g:airline_powerline_fonts = 1
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
nnoremap <silent> Z  :call CocAction('doHover')<CR>
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

