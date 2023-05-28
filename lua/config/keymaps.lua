-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Open Netrw
vim.keymap.set("n", "<leader>pv", "<Cmd>Ex<CR>", { desc = "Open Netrw" })

-- Re-center after jump
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzzzv", {})
vim.keymap.set("n", "N", "Nzzzv", {})

-- Replace ex mode with gq
vim.keymap.set({ "n", "v", "o" }, "Q", "gq")

-- Undo H, L remap
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

-- Add alternative visual block mode keymap
vim.keymap.set({ "n" }, "<leader>v", "<C-v>", { desc = "Visual Block mode" })

-- Insert newlines without entering Insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert newline below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert newline below" })
