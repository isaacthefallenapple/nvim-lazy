-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- [[ Remove garbage default comment format options ]]
-- See `:help formatoptions`
local format_group = vim.api.nvim_create_augroup('FormatOptions', {})
vim.api.nvim_create_autocmd('BufEnter', {
    group = format_group,
    callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { 'o' } end,
})

local filetype_group = vim.api.nvim_create_augroup('Filetype', {})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.v',
    callback = function(_)
        vim.o.filetype = 'vlang'
    end,
})

local startup_group = vim.api.nvim_create_augroup("Startup", {})
-- :cd into <dir> when opening it with nvim <dir>
vim.api.nvim_create_autocmd("VimEnter", {
  group = startup_group,
  callback = function(_)
    vim.cmd({ cmd = "cd", args = { "%:p:h" } })
  end,
})
