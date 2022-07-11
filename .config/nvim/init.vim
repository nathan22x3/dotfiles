"-------------------------------------------------------------------------------
" Basic settings
"-------------------------------------------------------------------------------
syntax enable
set encoding=utf-8
set hidden
set nobackup nowritebackup noswapfile
set lazyredraw
set updatetime=50
set shortmess+=c
set path+=**
set wildignore+=*/node_modules/*
set clipboard^=unnamed

set number relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set autoindent smartindent
set wrap linebreak nolist
set textwidth=0
set ignorecase smartcase
set cursorline

set mouse=a
set signcolumn=yes
set showtabline=2
set noshowmode
set scrolloff=8
set splitright
autocmd FileType help wincmd L

"-------------------------------------------------------------------------------
" Imports
"-------------------------------------------------------------------------------
runtime ./plugs.vim
runtime ./maps.vim

" Theme
set termguicolors
set winblend=0
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
" Lightline
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
      \ 'left': [
        \ [ 'mode', 'filetype' ],
        \ [ 'readonly', 'modified' ],
      \ ],
      \ 'right': [
        \ [ 'gitbranch' ],
        \ [ 'lineinfo' ],
      \ ],
    \ },
    \ 'inactive': {
      \ 'left': [
        \ [ 'filetype' ],
        \ [ 'readonly', 'modified' ],
      \ ],
      \ 'right': [
        \ [ 'gitbranch' ],
        \ [ 'lineinfo' ],
      \ ],
    \ },
    \ 'tabline': {
      \ 'left': [ [ 'buffers' ] ],
    \ },
    \ 'component': {
      \ 'lineinfo': ' %2p%% %3l:%-2v',
    \ },
    \ 'component_expand': {
        \ 'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
        \ 'buffers': 'tabsel'
    \ },
    \ 'component_raw': {
        \ 'buffers': 1
    \ },
    \ 'component_function': {
      \ 'filetype': 'MyFiletype',
      \ 'fileformat': 'MyFileformat',
    \ },
  \ }

let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#composed_number_map = {
    \ 1:  '⑴ ', 2:  '⑵ ', 3:  '⑶ ', 4:  '⑷ ', 5:  '⑸ ',
    \ 6:  '⑹ ', 7:  '⑺ ', 8:  '⑻ ', 9:  '⑼ ', 10: '⑽ ',
    \ 11: '⑾ ', 12: '⑿ ', 13: '⒀ ', 14: '⒁ ', 15: '⒂ ',
    \ 16: '⒃ ', 17: '⒄ ', 18: '⒅ ', 19: '⒆ ', 20: '⒇ '
  \ }

"-------------------------------------------------------------------------------
" Floating terminal - Credit: https://github.com/huytd/vim-config
"-------------------------------------------------------------------------------
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)

  " Border Window
  let border_opts = {
      \ 'relative': 'editor',
      \ 'row': row - 1,
      \ 'col': col - 2,
      \ 'width': width + 4,
      \ 'height': height + 2,
      \ 'style': 'minimal',
    \ }

  " Terminal Window
  let opts = {
      \ 'relative': 'editor',
      \ 'row': row,
      \ 'col': col,
      \ 'width': width,
      \ 'height': height,
      \ 'style': 'minimal'
    \ }

  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)

  " Styling
  hi FloatWinBorder guifg=#bd93f9
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert

  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

nnoremap <silent> \t :call FloatTerm()<cr>

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>G :Goyo<cr>

" ----------------------------------------------------------------------------
" fzf-vim
" ----------------------------------------------------------------------------
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9 } }
