if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require('lspsaga')

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = 'round'
}
EOF

nnoremap <silent> <C-k> :Lspsaga hover_doc<cr>
nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<cr>
nnoremap <silent> <C-N> :Lspsaga diagnostic_jump_prev<cr>
nnoremap <silent> <C-h> :Lspsaga signature_help<cr>
nnoremap <silent> gh :Lspsaga lsp_finder<cr>
