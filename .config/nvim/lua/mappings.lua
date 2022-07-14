HOME = os.getenv('HOME')

local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function cmap(shortcut, command)
  map('c', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- basic mappings
nmap('<leader>r', ':so ' .. HOME .. '/.config/nvim/init.lua<cr>') -- reload configurations
nmap('<leader>h', ':nohl<cr>') -- clear search highlighting
imap('jj', '<Esc>') -- quickly exit insert mode

-- moving cursor in insert mode
imap('<C-h>', '<C-o>h')
imap('<C-j>', '<C-o>j')
imap('<C-k>', '<C-o>k')
imap('<C-l>', '<C-o>a')

-- arithmetic
nmap('+', '<C-a>') -- increase the number by 1
nmap('-', '<C-x>') -- decrease the number by 1

-- buffer
nmap('<C-s>', ':w<cr>') -- save current buffer
imap('<C-s>', '<Esc>:w<cr>') -- save current buffer

nmap('<S-h>', ':bprev<cr>') -- jump to the previous buffer
nmap('<S-l>', ':bnext<cr>') -- Jump to the next buffer
nmap('<leader>bd', ':bdelete<cr>') -- kill current buffer

-- window
nmap('ss', ':vsplit<cr>') -- split window horizontally
nmap('sv', ':split<cr>') -- split window vertically

nmap('<leader>wh', '<C-w>h') -- jump to the left window
nmap('<leader>wj', '<C-w>j') -- jump to the below window
nmap('<leader>wk', '<C-w>k') -- jump to the above window
nmap('<leader>wl', '<C-w>l') -- jump to the right window

-- coc.nvim and completion
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true }) -- cycle forward completion menu

vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true }) -- cycle backward completion menu

vim.keymap.set('i', '<cr>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<C-g>u<cr>'
end, { expr = true, noremap = true }) -- accept completion

vim.keymap.set('i', '<C-space>', 'coc#refresh()', { expr = true, noremap = true }) -- trigger completion

nmap('gd', '<Plug>(coc-definition)')
nmap('gt', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')
nmap('<F2>', '<Plug>(coc-rename)')

nmap('gh', function()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.fn.feedkeys('K', 'in')
  end
end)

nmap('<leader>.', '<Plug>(coc-codeaction)')
nmap('<F7>', '<Plug>(coc-diagnostic-prev)')
nmap('<F8>', '<Plug>(coc-diagnostic-next)')

if vim.fn.has('nvim-0.4.0') or vim.fn.has('patch-8.2.0750') then
  vim.keymap.set('n', '<C-j>', function()
    return vim.fn['coc#float#has_scroll']() == 1 and vim.fn['coc#float#scroll'](1) or '<C-j>'
  end, { expr = true, nowait = true, noremap = true, silent = true })

  vim.keymap.set('n', '<C-k>', function()
    return vim.fn['coc#float#has_scroll']() == 1 and vim.fn['coc#float#scroll'](0) or '<C-k>'
  end, { expr = true, nowait = true, noremap = true, silent = true })
end

-- telescope
nmap('<C-p>', ':Telescope find_files<cr>')
nmap('<leader>f', ':Telescope live_grep<cr>')
nmap('\\\\', ':Telescope buffers<cr>')
nmap('<leader>,', ':Telescope help_tags<cr>')

-- nvim-tree
nmap('<C-b>', ':NvimTreeToggle<cr>')
