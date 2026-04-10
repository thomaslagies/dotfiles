return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame --date=short<CR>", {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>ph", ":Gitsigns preview_hunk<CR>, {}")
			vim.keymap.set("n", "<leader>lb", ":Gitsigns toggle_current_line_blame<CR>, {}")
		end,
	},
}
