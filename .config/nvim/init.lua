vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.opt.number = true

vim.keymap.set("n", "<leader>so", ":so<CR>")
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.opt.textwidth = 120
vim.opt.colorcolumn = "120"
vim.opt.updatetime = 50

vim.opt.confirm = true

vim.keymap.set("n", "mk", ":m .-2<CR>", {desc = "Move line one up"})
vim.keymap.set("n", "mj", ":m .+1<CR>", {desc = "Move line one down"})

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

-- TESTING
--

-- FZF settings
vim.env.FZF_DEFAULT_OPTS = "--preview-window=right:60%"
vim.g.fzf_layout = {
  window = {
    width = 1,
    height = 1,
    yoffset = 1,
    xoffset = 1,
    border = "sharp",
  },
}

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
	
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>m", ":bprevious<CR>")

function SwapWithNextWindow()
  local cur_win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins < 2 then return end
  local cur_idx
  for i, w in ipairs(wins) do
    if w == cur_win then cur_idx = i break end
  end
  local next_idx = (cur_idx % #wins) + 1
  local cur_buf = vim.api.nvim_win_get_buf(cur_win)
  local next_buf = vim.api.nvim_win_get_buf(wins[next_idx])
  vim.api.nvim_win_set_buf(cur_win, next_buf)
  vim.api.nvim_win_set_buf(wins[next_idx], cur_buf)
end

vim.keymap.set('n', '<leader>sw', SwapWithNextWindow, {desc = "Swap buffers between windows"})
vim.keymap.set('n', 'H', '<C-w>h', {desc = "Go to left window"})
vim.keymap.set('n', 'J', '<C-w>j', {desc = "Go to below window"})
vim.keymap.set('n', 'K', '<C-w>k', {desc = "Go to above window"})
vim.keymap.set('n', 'L', '<C-w>l', {desc = "Go to right window"})
	
-- PLUGINS --
vim.pack.add { 'https://github.com/stevearc/oil.nvim'}
require("oil").setup()
vim.keymap.set('n', '<leader>o', ':Oil<CR>', {desc = "Open Oil to search files"})

vim.pack.add {'https://github.com/catppuccin/nvim'}
vim.cmd.colorscheme('catppuccin')

vim.pack.add {'https://github.com/neovim/nvim-lspconfig'}
