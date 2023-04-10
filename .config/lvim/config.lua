-- global
lvim.leader = "space"

-- general
local opt = vim.opt

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox-baby"
lvim.transparent_window = true

opt.lazyredraw = true -- for better performance while	executing macros
opt.synmaxcol = 300 -- stop syntax highlight after number of lines for performance
opt.laststatus = 3 -- always show status line of the last window
opt.scrolloff = 10 -- keep above and below the cursor number of lines
opt.showtabline = 2 -- always show tabs

opt.relativenumber = true -- displayed number to be	relative to the cursor
opt.signcolumn = "yes" -- always show the sign column

-- mappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<cr>"
lvim.keys.insert_mode["jk"] = "<Esc>"

lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.which_key.mappings["t"] = {
  name = "Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

-- misc
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 35
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.highlight.enabled = true

-- lualine
local lualine = lvim.builtin.lualine

if lualine then
  local options = lualine.options
  local sections = lualine.sections
  local inactive_sections = lualine.inactive_sections

  -- options
  options.theme = "gruvbox"
  options.icons_enabled = true
  options.component_separators = { left = '', right = '' }
  options.section_separators = { left = '', right = '' }

  -- sections
  sections.lualine_a = { "mode" }
  sections.lualine_b = {
    { "branch", icon = "🌱" }
  }
  sections.lualine_c = {
    { "filename", file_status = true, path = 0 },
    "diagnostics",
  }
  sections.lualine_x = { "encoding", "fileformat", "filetype" }
  sections.lualine_y = { "progress" }
  sections.lualine_z = { "location" }

  -- inactive sections
  inactive_sections.lualine_a = {}
  inactive_sections.lualine_b = {}
  inactive_sections.lualine_c = {
    { "filename", file_status = true, path = 1 },
  }
  inactive_sections.lualine_x = {}
  inactive_sections.lualine_y = {}
  inactive_sections.lualine_z = {}
end

-- additional plugins
lvim.plugins = {
  "tpope/vim-surround",
  "vim-scripts/argtextobj.vim",
  "luisiacc/gruvbox-baby",
  "norcalli/nvim-colorizer.lua",
  "stevearc/dressing.nvim",
  "ziontee113/color-picker.nvim",
  "ziontee113/icon-picker.nvim",
}

require("colorizer").setup()
require("color-picker").setup()
require("icon-picker").setup({
  disable_legacy_commands = true
})

lvim.builtin.which_key.mappings["<space>"] = {
  name = "Picker",
  c = { ":PickColor<cr>", "Color Picker" },
  i = { ":IconPickerNormal<cr>", "Icon Picker" }
}
