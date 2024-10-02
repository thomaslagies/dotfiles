local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function OpenCopilotChat()
  local current_buf = vim.api.nvim_get_current_buf()

  vim.cmd("CopilotChat")

  -- Close the original buffer after a short delay
  vim.defer_fn(function()
    if vim.api.nvim_buf_is_valid(current_buf) then
      vim.cmd("bd " .. current_buf)
    end
  end, 10)
end

vim.api.nvim_create_user_command("CopilotChatStart", function()
  vim.defer_fn(function()
    OpenCopilotChat()
  end, 50) 
end, {})

require("opts")
require("lazy").setup("plugins")
