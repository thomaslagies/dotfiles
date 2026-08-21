-- cache compiled Lua modules
vim.loader.enable()

vim.g.mapleader = ' '
--vim.opt.guicursor = ''

vim.g.have_nerd_font = true
vim.opt.termguicolors = true

vim.opt.number = true

vim.opt.breakindent = true

vim.keymap.set('n', '<leader>so', ':so<CR>')
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.confirm = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', 'mk', ':m .-2<CR>', { desc = 'Move line one up' })
vim.keymap.set('n', 'mj', ':m .+1<CR>', { desc = 'Move line one down' })

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>r', [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Disable unused providers to speed up startup and disable warning in :che
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- TESTING
vim.pack.add { 'https://github.com/NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { 'https://github.com/folke/which-key.nvim' }
require('which-key').setup {
	-- Delay between pressing a key and opening which-key (milliseconds)
	delay = 1000,
	icons = { mappings = vim.g.have_nerd_font },
	-- Document existing key chains
	spec = {
		{ '<leader>ll', group = '[S]earch',    mode = { 'n', 'v' } },
		{ '<leader>t', group = '[T]oggle' },
		{ '<leader>h', group = 'Git [H]unk',  mode = { 'n', 'v' } },  -- Enable gitsigns recommended keymaps first
		{ 'gr',        group = 'LSP Actions', mode = { 'n' } },
	},
}
--

-- FZF settings
vim.env.FZF_DEFAULT_OPTS = '--preview-window=right:60%'
vim.g.fzf_layout = {
	window = {
		width = 1,
		height = 1,
		yoffset = 1,
		xoffset = 1,
		border = 'sharp',
	},
}

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>n', ':bnext<CR>')
vim.keymap.set('n', '<leader>m', ':bprevious<CR>')

function SwapWithNextWindow()
	local cur_win = vim.api.nvim_get_current_win()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins < 2 then return end
	local cur_idx
	for i, w in ipairs(wins) do
		if w == cur_win then
			cur_idx = i
			break
		end
	end
	local next_idx = (cur_idx % #wins) + 1
	local cur_buf = vim.api.nvim_win_get_buf(cur_win)
	local next_buf = vim.api.nvim_win_get_buf(wins[next_idx])
	vim.api.nvim_win_set_buf(cur_win, next_buf)
	vim.api.nvim_win_set_buf(wins[next_idx], cur_buf)
end

vim.keymap.set('n', '<leader>sw', SwapWithNextWindow, { desc = 'Swap buffers between windows' })
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Go to below window' })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Go to above window' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Go to right window' })

vim.pack.add { 'https://github.com/catppuccin/nvim' }
require('catppuccin').setup() -- auto_integrations detects treesitter/gitsigns/telescope/dap/etc.
vim.cmd.colorscheme('catppuccin')

vim.keymap.set('n', '<leader>gg', function() vim.system({ 'kitty', '-e', 'lazygit' }) end, { desc = 'Lazygit in new window' })

-- PLUGINS --
vim.pack.add { 'https://github.com/nvim-tree/nvim-web-devicons' }
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup(
	{
		default_file_explorer = true,
		columns = {
			'icon'
		},
		view_options = {
			show_hidden = true,
		},
		float = {
			preview_split = 'auto',
		},
		preview_win = {
			update_on_cursor_moved = true,
		},
	}
)
vim.keymap.set('n', '<leader>o', ':Oil<CR>', { desc = 'Open Oil to search files' })

vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
	signs = {
		add = { text = '+' }, ---@diagnostic disable-line: missing-fields
		change = { text = '~' }, ---@diagnostic disable-line: missing-fields
		delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
		topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
		changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
	},
}
vim.pack.add { 'https://github.com/tpope/vim-fugitive' }
vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
vim.pack.add { 'https://github.com/nvim-telescope/telescope.nvim' }
vim.pack.add { 'https://github.com/nvim-telescope/telescope-ui-select.nvim' }

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pp', telescope.find_files, {})
vim.keymap.set('n', '<leader>gr', telescope.live_grep, {})
require('telescope').setup({
	pickers = {
		find_files = {
			hidden = true,
			file_ignore_patterns = { 'node_modules', '.git/' },
		},
		live_grep = {
			additional_args = function()
				return { '--hidden' }
			end,
		},
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown({}),
		},
	},
})
require('telescope').load_extension('ui-select')

-- Treesitter: highlighting + injections (e.g. bash inside `run:`/`script:` blocks in yaml)
vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }
require('nvim-treesitter').install {
	'bash', 'lua', 'yaml', 'javascript', 'json', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'query', 'diff',
}
vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
})

-- LSPs
vim.lsp.config.tsgo = {
	cmd = { 'tsgo', '--lsp', '--stdio' },
	filetypes = { 'javascript' },
	root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
vim.lsp.enable('tsgo')

vim.lsp.config.bashls = {
	cmd = { 'bash-language-server', 'start' },
	filetypes = { 'bash', 'sh' }
}
vim.lsp.enable 'bashls'

vim.lsp.config.yamlls = {
	cmd = { 'yaml-language-server', '--stdio' },
	filetypes = { 'yaml' } -- *.yml files are already filetype 'yaml' in Neovim; 'yml' is not a real filetype
}
vim.lsp.enable 'yamlls'

vim.lsp.config.lua_ls = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.git', '.luarc.jsonc' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' }, -- this is to stop the language server from complaining about 'vim' being an undefined global variable
			},
			format = {
				defaultConfig = {
					quote_style = 'single',
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
		},
	},
}

vim.lsp.enable 'lua_ls'

-- Prefer the repo's own prettier/eslint so versions + configs match the project
local function project_bin(name)
	local root = vim.fs.root(0, 'node_modules')
	local p = root and (root .. '/node_modules/.bin/' .. name)
	return (p and vim.uv.fs_stat(p)) and p or name
end

vim.keymap.set('n', '<leader>gf', function()
	local file = vim.fn.expand('%:p')
	vim.cmd('silent write')
	vim.fn.system({ project_bin('prettier'), '--write', file }) -- reads .prettierrc/.editorconfig
	vim.cmd('silent edit')                                     -- reload prettier's changes
	vim.lsp.buf.format()                                       -- eslint LSP (eslint config) + lua_ls etc.
end, { desc = 'Format: prettier + eslint, repo configs' })

-- DAP (Debug Adapter Protocol) --
vim.pack.add { 'https://github.com/mfussenegger/nvim-dap' }
vim.pack.add { 'https://github.com/rcarriga/nvim-dap-ui' }
vim.pack.add { 'https://github.com/nvim-neotest/nvim-nio' }

local dap = require('dap')
local dapui = require('dapui')

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

dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Start/Continue debugging' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over' })
vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step out' })
vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'Restart debugger' })
vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Toggle DAP UI' })

-- Markdown inline rendering
vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup({
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
	html = { enabled = false }, -- no html treesitter parser installed; avoids the healthcheck warning
	render_modes = { 'n', 'c' }, -- modes where rendering is active
	file_types = { 'markdown', 'copilot-chat' },
})

-- AI stuff
vim.pack.add { 'https://github.com/github/copilot.vim' }
vim.keymap.set('i', '<C-.>', 'copilot#Next()', { expr = true, silent = true, desc = 'Next Copilot suggestion' })
vim.keymap.set('i', '<C-,>', 'copilot#Previous()', { expr = true, silent = true, desc = 'Previous Copilot suggestion' })

vim.pack.add { 'https://github.com/CopilotC-Nvim/CopilotChat.nvim' }
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<Tab>")', { expr = true, replace_keycodes = false })

require('CopilotChat').setup({
	window = {
		layout = 'vertical',
		-- width = 90, -- Fixed width in columns
		-- height = 90, -- Fixed height in rows
		title = '🤖 Copilot',
		zindex = 100, -- Ensure window stays on top
	},
	context = 'buffer',
	model = 'claude-opus-4.6',
	headers = {
		user = '👤 You',
		assistant = '🤖 Copilot',
		tool = '🔧 Tool',
	},
	separator = '━━',
	auto_fold = true, -- Automatically folds non-assistant messages
})

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>ai', ':CopilotChat<CR>', { desc = 'Open Copilot Chat' })
vim.keymap.set('n', '<leader>aa', function()
	require('CopilotChat').open({ context = 'buffer' })
end, { desc = 'Open Copilot Chat with buffer context' })

-- Make copilot suggestions work in the copilot-chat buffer
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'copilot-chat',
	callback = function()
		vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")',
			{ expr = true, replace_keycodes = false, buffer = true })
	end,
})

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>ag', function()
	require('CopilotChat').ask('#buffer Explain this code', {
		callback = function()
		end,
	})
end, { desc = 'Ask Copilot to explain code in current buffer' })

-- Claude integration
vim.pack.add { 'https://github.com/greggh/claude-code.nvim' }
require('claude-code').setup({
	model = 'claude-opus-4-8',
	window = {
		position = 'vertical',
		split_ratio = 0.4,
	},
	git = {
		use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
	}
})
vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })

-- Smear my cursor
vim.pack.add { 'https://github.com/sphamba/smear-cursor.nvim' }
require('smear_cursor').setup({
	enabled = false,
	stiffness = 0.8,
	trailing_stiffness = 0.6,
	stiffness_insert_mode = 0.7,
	trailing_stiffness_insert_mode = 0.7,
	damping = 0.95,
	damping_insert_mode = 0.95,
	distance_stop_animating = 0.5,
	time_interval = 5,
})

vim.keymap.set('n', '<leader>sc', require('smear_cursor').toggle, { desc = 'Toggle smear cursor' })
