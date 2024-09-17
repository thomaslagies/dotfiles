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


   -- Define the function to start CopilotChat and close the default buffer
   function OpenCopilotChat()
     -- Save the current buffer number
     local current_buf = vim.api.nvim_get_current_buf()

     -- Start CopilotChat
     vim.cmd('CopilotChat')

     -- Close the original buffer after a short delay
     vim.defer_fn(function()
       if vim.api.nvim_buf_is_valid(current_buf) then
         vim.cmd('bd ' .. current_buf)
       end
     end, 10)  -- Short delay to allow CopilotChat to open
   end

   -- Create a custom command to call the function
   vim.api.nvim_create_user_command('CopilotChatStart', function()
     vim.defer_fn(function()
       OpenCopilotChat()
     end, 50)  -- Delay in milliseconds to ensure plugins are loaded
   end, {})

require("opts")
require("lazy").setup("plugins")
