let mapleader = ' '

" Load config
nnoremap <leader>r :so ~/.config/nvim/init.vim<cr>

" Save
inoremap <C-s> <Esc>:update<cr>
nnoremap <C-s> :update<cr>

" Exit insert mode
inoremap jj <Esc>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Remap scroll
nnoremap <C-up> <C-u>
nnoremap <C-down> <C-d>

" Select all
map <C-a> <Esc>ggVG

" Increment/decrement number
nnoremap + <C-a>
nnoremap - <C-x>

" Remove highlight
nmap <silent><leader><space> :nohlsearch<cr>

" Use K/J to jump to next/previous buffer
nnoremap <silent>L :bnext<cr>
nnoremap <silent>H :bprev<cr>

" Close current buffer
nnoremap <silent> \c :bdelete<cr>

" Split window
nmap ss :vsplit<cr>
nmap sv :split<cr>

" Move window
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" Move line up/down
nnoremap <C-up> dd<up>P
nnoremap <C-down> ddp

" Copy line up/down
nnoremap <M-S-up> yyP
nnoremap <M-S-down> yyp

" NERDTree
let g:NERDTreeWinSize=40
nnoremap <C-b> :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <C-f> :NERDTreeFind<cr>
nnoremap <leader>f :wincmd p<cr>
