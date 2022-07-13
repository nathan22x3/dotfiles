local api = vim.api

api.nvim_create_autocmd('FileType',
  { pattern = 'help', command = 'wincmd L' }
) -- open the help window to the right of the current one
