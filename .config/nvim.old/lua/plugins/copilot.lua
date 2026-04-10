return {
	"github/copilot.vim",
	config = function()
		vim.cmd([[imap <silent><expr> <C-a> copilot#Accept("\<CR>")]])
		vim.cmd([[imap <silent><expr> <C-n> copilot#Next()]])
    vim.g.copilot_settings = { selectedCompletionModel = 'gpt-5-copilot' }
    vim.g.copilot_integration_id = "vscode-chat"
	end,
}
