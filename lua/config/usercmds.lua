vim.api.nvim_create_user_command("Config", function()
  vim.cmd.cd(vim.fn.stdpath("config"))
  vim.cmd("Ex")
end, {})
