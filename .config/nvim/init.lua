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

-- vim.pack.add {'https://github.com/catppuccin/nvim'}
vim.cmd.colorscheme('catppuccin')


vim.pack.add {'https://github.com/nvim-lua/plenary.nvim'}
vim.pack.add {'https://github.com/nvim-telescope/telescope.nvim'}
vim.pack.add {'https://github.com/nvim-telescope/telescope-ui-select.nvim'}

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>pp", telescope.find_files, {})
vim.keymap.set("n", "<leader>gr", telescope.live_grep, {})
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
						file_ignore_patterns = { "node_modules", ".git/" },
					},
					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")

vim.pack.add {'https://github.com/emrearmagan/atlas.nvim'}

vim.lsp.config.tsgo = {
	filetypes = { 'javascript', 'javascriptreact', 'typescript',  }
}
vim.lsp.enable('tsgo')

vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
}
vim.lsp.enable 'bashls'

vim.lsp.config.yamlls = {
	cmd = { 'yaml-language-server', '--stdio' },
	filetypes = { 'yaml', 'yml' }
}
vim.lsp.enable 'yamlls'

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

vim.pack.add {'https://github.com/github/copilot.vim'}
vim.keymap.set('i', '<C-.>', 'copilot#Next()', { expr = true, silent = true, desc = 'Next Copilot suggestion' })
vim.keymap.set('i', '<C-,>', 'copilot#Previous()', { expr = true, silent = true, desc = 'Previous Copilot suggestion' })

vim.pack.add {'https://github.com/CopilotC-Nvim/CopilotChat.nvim'}
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<Tab>")', { expr = true, replace_keycodes = false })
require("CopilotChat").setup({
  window = {
    layout = 'vertical',
    -- width = 90, -- Fixed width in columns
    -- height = 90, -- Fixed height in rows
    title = '🤖 Copilot',
    zindex = 100, -- Ensure window stays on top
  },

	context = "buffer",
	model = "claude-opus-4.6",

  selection = require("CopilotChat.select").buffer,

  headers = {
    user = '👤 You',
    assistant = '🤖 Copilot',
    tool = '🔧 Tool',
  },

  separator = '━━',
  auto_fold = true, -- Automatically folds non-assistant messages
})
vim.keymap.set({'n','v','x'}, '<leader>ai', ':CopilotChat<CR>', { desc = 'Open Copilot Chat' })
vim.keymap.set('n', '<leader>aa', function()
  require("CopilotChat").open({ context = "buffer" })
end, { desc = 'Open Copilot Chat with buffer context' })

-- Make copilot suggestions work in the copilot-chat buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat", 
  callback = function()
    vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false, buffer = true })
  end,
})

vim.keymap.set({'n','v','x'}, '<leader>ag', function()
  require('CopilotChat').ask('#buffer Explain this code', {
    callback = function(response)
    end,
})
end, { desc = 'Ask Copilot to explain code in current buffer' })

-- DAP (Debug Adapter Protocol) --
vim.pack.add {'https://github.com/mfussenegger/nvim-dap'}
vim.pack.add {'https://github.com/rcarriga/nvim-dap-ui'}
vim.pack.add {'https://github.com/nvim-neotest/nvim-nio'}

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { vim.fn.expand('~/.local/share/nvim/js-debug/out/src/dapDebugServer.js'), '${port}' },
  },
}

dap.configurations.javascript = {
  {
		type = 'pwa-node',
		request = 'attach',
		name = 'Attach to Docker',
		port = 9229,
		address = 'localhost',
		localRoot = '${workspaceFolder}',
		remoteRoot = '/code',
		restart = true,
		resolveSourceMapLocations = { '!**/node_modules/**' },
		skipFiles = { '<node_internals>/**' },
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue debugging" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart debugger" })
vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle DAP UI" })

-- Markdown inline rendering

vim.pack.add{'https://github.com/MeanderingProgrammer/render-markdown.nvim'}
require("render-markdown").setup({
  heading = {
    enabled = true,
  },
  code = {
    enabled = true,
    style = 'full', -- 'full', 'normal', 'language', 'none'
  },
  bullet = {
    enabled = true,
  },
  checkbox = {
    enabled = true,
  },
  pipe_table = {
    enabled = true,
    style = 'full', -- 'full', 'normal', 'none'
  },
  latex = { enabled = false },
  render_modes = { 'n', 'c' }, -- modes where rendering is active
  file_types = { 'markdown', 'copilot-chat' },
})
