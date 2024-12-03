syntax enable
filetype on
filetype plugin on
filetype indent on
set updatetime=100
set termwinsize=15x0
set signcolumn=number
set scrolloff=2
set autoindent
set hlsearch
set number
set relativenumber
set noswapfile
set ignorecase
set smartcase
set nowrap
set mouse=a
set splitright
set splitbelow
set title
set nocompatible
set wildmenu
set autowrite
set autowriteall
set wildmode=longest:full,full
set wildoptions=pum
set clipboard=unnamedplus,unnamed
set pumheight=15
set laststatus=2
set fillchars=eob:\ 
set completeopt=menuone,noinsert,noselect,preview
let g:netrw_banner = 0
let g:netrw_winsize = 20
set statusline+=%*\ %n\ %*
set statusline+=%*%{&ff}%*
set statusline+=%*%y%*
set statusline+=%*\ %<%F%*
set statusline+=%*%m%*
set statusline+=%*%=%5l%*
set statusline+=%*/%L%*
set statusline+=%*%4v\ %*
let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlight_delay = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }


" FUNCTIONS
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> ge <plug>(lsp-previous-diagnostic)
	nmap <buffer> gE <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nmap <buffer> <expr><c-f> lsp#scroll(+4)
	nmap <buffer> <expr><c-d> lsp#scroll(-4)
	nmap <buffer> <leader>r <plug>(lsp-rename)
	nmap <buffer> <leader>a <plug>(lsp-code-action)
	nmap <buffer> <leader>o <plug>(lsp-document-symbol)
	nmap <buffer> <leader>e <plug>(lsp-document-diagnostics)
endfunction
augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" PLUGINS
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


" AUTOCMD
autocmd FileType qf setlocal norelativenumber
autocmd InsertLeave * update


" COLORS
colorscheme lunaperche
set background=dark
highlight Normal ctermbg=NONE guibg=NONE
highlight link Function PreProc
highlight LspErrorText ctermfg=Red guifg=Red
highlight LspWarningText ctermfg=Yellow guifg=Yellow
highlight LspInformationText ctermfg=Blue guifg=Blue
highlight LspHintText ctermfg=Green guifg=Green
highlight LspErrorHighlight cterm=underline term=underline ctermfg=Red guifg=Red
highlight LspWarningHighlight cterm=underline term=underline ctermfg=Yellow guifg=Yellow
highlight LspInformationHighlight cterm=underline term=underline ctermfg=Blue guifg=Blue
highlight LspHintHighlight cterm=underline term=underline ctermfg=Green guifg=Green
highlight link lsperrorvirtualtext nontext
highlight link lspwarningvirtualtext nontext
highlight link lspinformationvirtualtext nontext
highlight link LspHintVirtualText NonText


" KEYBINDS
let g:mapleader = ' '
nnoremap <silent><C-q> :q!<CR>
tnoremap <silent><C-q> <C-w>N:q!<CR>
nnoremap <silent><C-b> :Lexplore!<CR>
tnoremap <silent><C-b> <C-w>N:Lexplore!<CR>
nnoremap <silent><C-s> :w!<CR>
nnoremap <C-x> :term<UP>

nnoremap <silent><leader>n :noh<CR>
nnoremap <silent><leader>f :Files<CR>
nnoremap <silent><leader>s :Rg<CR>
nnoremap <silent><leader>c :Commands<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>g :Commits<CR>

inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap <silent><C-h> <C-W><C-H>
nnoremap <silent><C-j> <C-W><C-J>
nnoremap <silent><C-k> <C-W><C-K>
nnoremap <silent><C-l> <C-W><C-L>
tnoremap <silent><C-h> <C-\><C-N><C-W><C-H>
tnoremap <silent><C-j> <C-\><C-N><C-W><C-J>
tnoremap <silent><C-k> <C-\><C-N><C-W><C-K>
tnoremap <silent><C-l> <C-\><C-N><C-W><C-L>
nnoremap <silent><C-l> :tabnext<CR>
nnoremap <silent><C-h> :tabprevious<CR>
nnoremap <silent><C-t> :tabnew<CR>
tnoremap <silent><C-l> <C-\><C-N>:tabnext<CR>
tnoremap <silent><C-h> <C-\><C-N>:tabprevious<CR>
tnoremap <silent><C-t> <C-\><C-N>:tabnew<CR>
