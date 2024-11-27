require("config.lazy")

-- Basic settings
vim.opt.compatible = false
vim.opt.showmatch = true               -- Show matching
vim.opt.ignorecase = true              -- Case insensitive search
vim.opt.mouse = "a"                    -- Enable mouse support
vim.opt.hlsearch = true                -- Highlight search
vim.opt.incsearch = true               -- Incremental search
vim.opt.tabstop = 4                    -- Number of columns occupied by a tab
vim.opt.softtabstop = 4                -- Treat multiple spaces as tabstops
vim.opt.expandtab = true               -- Converts tabs to spaces
vim.opt.shiftwidth = 4                 -- Width for autoindents
vim.opt.autoindent = true              -- Auto-indent new lines
vim.opt.number = true                  -- Show line numbers
vim.opt.relativenumber = true          -- Show relative line numbers
vim.opt.wildmode = { "longest", "list" } -- Bash-like tab completions
vim.cmd("filetype plugin indent on")   -- Enable filetype-specific indenting
vim.cmd("syntax on")                   -- Enable syntax highlighting
vim.opt.cursorline = true              -- Highlight current cursor line
vim.opt.ttyfast = true                 -- Speed up scrolling in Vim

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- Key mappings 
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Normal mode mappings
keymap("n", "<A-a>", "<C-a>", opts)
keymap("n", "<A-x>", "<C-x>", opts)
keymap("n", "<A-v>", "<C-v>", opts)
keymap("n", "<C-a>", "ggVG", opts)  -- Select all

-- Visual mode mappings
keymap("v", "<C-c>", '"+yi', opts)  -- Copy to clipboard
keymap("v", "<C-x>", '"+c', opts)   -- Cut to clipboard
keymap("v", "<C-v>", 'c<ESC>"+p', opts)  -- Paste from clipboard

-- Insert mode mapping
keymap("i", "<C-v>", '<ESC>"+pa', opts)  -- Paste from clipboard

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

