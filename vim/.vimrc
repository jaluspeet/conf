"SETTINGS
syntax enable
filetype on
filetype plugin on
filetype indent on
colorscheme wildcharm
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
set wildmode=longest:full,full
set wildoptions=pum
set clipboard+=unnamed
set pumheight=15
set laststatus=2
set fillchars=eob:\ 
set completeopt=menuone,noinsert,noselect,preview
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:autowrite = 1
let g:autowriteall = 1
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
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 0
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlight_delay = 0
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_align = 'right'

" AUTOCMD
autocmd TerminalOpen * setlocal nonumber norelativenumber
autocmd FileType qf setlocal norelativenumber

augroup CustomHighlights
	autocmd!
	autocmd ColorScheme * highlight Normal ctermbg=NONE

	autocmd ColorScheme * highlight link LspErrorLine CursorLine
	autocmd ColorScheme * highlight link LspWarningLine CursorLine
	autocmd ColorScheme * highlight link LspInformationLine CursorLine
	autocmd ColorScheme * highlight link LspHintLine CursorLine

	autocmd ColorScheme * highlight LspErrorText ctermbg=Red ctermfg=White
	autocmd ColorScheme * highlight LspWarningText ctermbg=Yellow ctermfg=Black
	autocmd ColorScheme * highlight LspInformationText ctermbg=Blue ctermfg=White
	autocmd ColorScheme * highlight LspHintText ctermbg=Green ctermfg=White

	autocmd ColorScheme * highlight LspErrorHighlight cterm=underline ctermfg=Red
	autocmd ColorScheme * highlight LspWarningHiglight cterm=underline ctermfg=Yellow
	autocmd ColorScheme * highlight LspInformationHighlight cterm=underline ctermfg=Blue
	autocmd ColorScheme * highlight LspHintHighlight cterm=underline ctermfg=Green

	autocmd ColorScheme * highlight link LspErrorVirtualText NonText
	autocmd ColorScheme * highlight link LspWarningVirtualText NonText
	autocmd ColorScheme * highlight link LspInformationVirtualText NonText
	autocmd ColorScheme * highlight link LspHintVirtualText NonText
augroup END


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
	nmap <buffer> <leader>r <plug>(lsp-rename)
	nmap <buffer> <leader>a <plug>(lsp-code-action)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
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


" KEYBINDS
let g:mapleader = ' '

nnoremap <silent><leader>n :noh<CR>
nnoremap <silent><leader>f :Files!<CR>
nnoremap <silent><leader>s :Rg!<CR>
nnoremap <silent><leader>c :Commands!<CR>
nnoremap <silent><leader>b :Buffers!<CR>
nnoremap <silent><leader>o :LspDocumentSymbol<CR>
nnoremap <silent><leader>e :LspDocumentDiagnostics<CR>

inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap <silent><C-b> :Lexplore!<CR><CR>
nnoremap <silent><C-q> :q!<CR>
nnoremap <silent><C-s> :term<CR>
tnoremap <silent><C-b> <C-w>N:Lexplore!<CR><CR>
tnoremap <silent><C-q> <C-w>N:q!<CR>
tnoremap <silent><C-s> make<CR>

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
