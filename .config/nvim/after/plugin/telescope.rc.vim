lua << EOF
require('telescope').setup {
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    mappings = {
      i = {
        ['Q'] = 'close',
      },
      n = {
        ['q'] = 'close'
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<C-d>"] = "delete_buffer",
        },
        n = {
          ["<C-d>"] = "delete_buffer",
        },
      },
    },
  },
}
EOF
       
nnoremap <silent> <C-p> :Telescope find_files<cr>
nnoremap <silent> <leader>b :Telescope buffers<cr>
nnoremap <silent> \g :Telescope git_files<cr>
nnoremap <silent> \l :Commits<cr>
nnoremap <silent> ;; :Telescope help_tags<cr>
