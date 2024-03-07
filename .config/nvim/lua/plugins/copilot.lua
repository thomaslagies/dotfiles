return {
	"github/copilot.vim",
	config = function()
		vim.cmd([[imap <silent><expr> <C-a> copilot#Accept("\<CR>")]])
		vim.cmd([[imap <silent><expr> <C-n> copilot#Next()]])
	end,
}
