-- sync lazy.nvim on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(_)
    require("lazy").sync({ show = false })
  end,
})
