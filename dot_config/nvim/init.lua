-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.clipboard = "unnamedplus"
vim.opt.formatoptions:remove({ "r", "o" })

vim.api.nvim_create_user_command("Wsudo", function()
  vim.cmd("write !sudo tee % > /dev/null")
  vim.cmd("edit!")
end, {})
