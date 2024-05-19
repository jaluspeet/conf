" SETTINGS
syntax enable
filetype on
filetype plugin on
filetype indent on
set autoindent
set hlsearch
set number
set relativenumber
set noswapfile
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
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

" KEYBINDS
let g:mapleader = ' '

nnoremap <C-x> :term 
nnoremap <silent><C-b> :Lex<CR><CR>
nnoremap <silent><C-s> :call <SID>ToggleTerminal()<CR>
tnoremap <silent><C-s> <C-w>N:call <SID>ToggleTerminal()<CR>

nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>, :bprevious<CR>
nnoremap <silent><leader>; :bnext<CR>
nnoremap <leader>. @:<CR>

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
