vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.ui.input = "Snacks.input"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 120

vim.g.copilot_no_tab_map = "v:true"
-- Map <leader>h to decrease the width of the current vertical split
vim.api.nvim_set_keymap('n', '<leader>h', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- Map <leader>l to increase the width of the current vertical split
vim.api.nvim_set_keymap('n', '<leader>l', ':vertical resize +5<CR>', { noremap = true, silent = true })

-- Map <leader>j to decrease the height of the current horizontal split
vim.api.nvim_set_keymap('n', '<leader>j', ':resize -5<CR>', { noremap = true, silent = true })

-- Map <leader>k to increase the height of the current horizontal split
vim.api.nvim_set_keymap('n', '<leader>k', ':resize +5<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>m", ":bprevious<CR>")

vim.keymap.set("n", "<leader>gg", function()
--	vim.cmd('silent ! tmux new-window -n git "lazygit"')
  vim.cmd('silent ! wezterm cli spawn --new-window lazygit')
end, { noremap = true, silent = true })

-- toggle between absolute and absolute/relative line numbers
vim.keymap.set("n", "<leader>ln", function()
  if vim.wo.relativenumber then
    vim.opt.relativenumber = false
    vim.opt.number = true
  else
    vim.opt.relativenumber = true
    vim.opt.number = true
  end
end, { noremap = true, silent = true })

