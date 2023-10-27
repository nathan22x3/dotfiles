-- global
lvim.leader = "space"

-- general
local opt = vim.opt

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox-baby"
lvim.transparent_window = true

opt.lazyredraw = true -- for better performance while	executing macros
opt.synmaxcol = 300   -- stop syntax highlight after number of lines for performance
opt.laststatus = 3    -- always show status line of the last window
opt.scrolloff = 10    -- keep above and below the cursor number of lines
opt.showtabline = 2   -- always show tabs
opt.tabstop = 4
opt.shiftwidth = 4

opt.relativenumber = true -- displayed number to be	relative to the cursor
opt.signcolumn = "yes"    -- always show the sign column

-- mappings
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<cr>"
lvim.keys.insert_mode["jk"] = "<Esc>"

lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.which_key.mappings["t"] = {
    name = "Terminal",
    f = { ":ToggleTerm<cr>", "Floating terminal" },
    v = { ":2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
    h = { ":2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

-- configure core plugins
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
    options.theme = "gruvbox-baby"
    options.icons_enabled = true
    options.component_separators = { left = "", right = "" }
    options.section_separators = { left = "", right = "" }

    -- sections
    sections.lualine_a = { "mode" }
    sections.lualine_b = {
        { "branch", icon = "🌱" },
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
    "stevearc/dressing.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = true,
    },
    {
        "ziontee113/color-picker.nvim",
        config = true,
    },
    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true,
            })
        end
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/zen-mode.nvim",
        },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = { notes = "~/notes" },
                            default_workspace = "notes",
                        },
                    },
                    ["core.keybinds"] = {
                        config = {
                            neorg_leader = "<Space>n",
                            hook = function(keybinds)
                                local leader = keybinds.leader

                                keybinds.map("norg", "n", "T", ":Neorg toc<cr>")
                                keybinds.map(
                                    "norg", "n", leader .. "im", ":Neorg inject-metadata<cr>",
                                    { desc = "Insert Metadata" }
                                )
                            end
                        },
                    },
                    ["core.qol.toc"] = {
                        config = { close_after_use = true },
                    },
                    ["core.concealer"] = {
                        config = { icon_preset = "diamond" },
                    },
                },
            }
            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
        end,
    }
}

lvim.builtin.which_key.mappings["<space>"] = {
    name = "Picker",
    c = { ":PickColor<cr>", "Color Picker" },
    i = { ":IconPickerNormal<cr>", "Icon Picker" },
}

lvim.builtin.which_key.mappings["n"] = {
    name = "Neorg",
    i = { name = "Insert" },
    l = { name = "List" },
    m = { name = "Mode" },
    n = { name = "Note" },
    t = { name = "Todos" },
}
