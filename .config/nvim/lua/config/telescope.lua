require('telescope').setup({
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    mappings = {
      i = {
        ['<C-q>'] = 'close',
      },
      n = {
        ['q'] = 'close'
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = 'dropdown',
      previewer = false,
      mappings = {
        i = {
          ['<C-d>'] = 'delete_buffer',
        },
        n = {
          ['<C-d>'] = 'delete_buffer',
        },
      },
    },
  },
})
