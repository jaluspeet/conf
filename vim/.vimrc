"SETTINGS
syntax enable
filetype on
filetype plugin on
filetype indent on
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
set cursorline
set nocompatible
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set clipboard+=unnamed
set paste
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
set statusline+=%*0x%04B\ %*
let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 0
let g:lsp_format_sync_timeout = 1000
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
hi CursorLine ctermbg=234 cterm=none
hi LineNr ctermfg=243
hi CursorLineNr ctermfg=15 ctermbg=234 cterm=none
hi SignColumn ctermbg=none
hi CursorLineSign ctermbg=234 cterm=none


" AUTOCMD
autocmd TerminalOpen * setlocal nonumber norelativenumber | startinsert
autocmd FileType qf setlocal nonumber norelativenumber 


" FUNCTIONS
let s:term_buf_nr = -1
function! s:ToggleTerminal() abort
    if s:term_buf_nr == -1
        execute "botright terminal"
        let s:term_buf_nr = bufnr("$")
    else
        try
            execute "bdelete! " . s:term_buf_nr
        catch
            let s:term_buf_nr = -1
            call <SID>ToggleTerminal()
            return
        endtry
        let s:term_buf_nr = -1
    endif
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
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

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
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
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
call plug#end()


" KEYBINDS
let g:mapleader = ' '

nnoremap <silent><C-b> :Lex<CR><CR>
nnoremap <silent><C-s> :call <SID>ToggleTerminal()<CR>
tnoremap <silent><C-s> <C-w>N:call <SID>ToggleTerminal()<CR>
nnoremap <silent><C-q> :q!<CR>
nnoremap <silent><C-n> :noh<CR>

nnoremap <silent><leader>f :Files!<CR>
nnoremap <silent><leader>s :Rg!<CR>
nnoremap <silent><leader>c :Commands!<CR>
nnoremap <silent><leader>b :Buffers!<CR>
nnoremap <silent><leader>o :LspDocumentSymbol<CR>
nnoremap <silent><leader>e :LspDocumentDiagnostics<CR>

nnoremap <silent><C-h> <C-W><C-H>
nnoremap <silent><C-j> <C-W><C-J>
nnoremap <silent><C-k> <C-W><C-K>
nnoremap <silent><C-l> <C-W><C-L>
tnoremap <silent><C-h> <C-\><C-N><C-W><C-H>
tnoremap <silent><C-j> <C-\><C-N><C-W><C-J>
tnoremap <silent><C-k> <C-\><C-N><C-W><C-K>
tnoremap <silent><C-l> <C-\><C-N><C-W><C-L>
nnoremap <silent><C-Tab> :tabnext<CR>
nnoremap <silent><C-S-Tab> :tabprevious<CR>
nnoremap <silent><C-w> :tabclose<CR>
nnoremap <silent><C-t> :tabnew<CR>
tnoremap <silent><C-Tab> <C-\><C-N>:tabnext<CR>
tnoremap <silent><C-S-Tab> <C-\><C-N>:tabprevious<CR>
tnoremap <silent><C-w> <C-\><C-N>:tabclose<CR>
tnoremap <silent><C-t> <C-\><C-N>:tabnew<CR>
