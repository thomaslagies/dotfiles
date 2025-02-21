return {
	"folke/twilight.nvim",
	opts = {
		treesitter = true,
    context = 1,
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
		},
	},
	config = function()
		local twilight_enabled = false

		_G.toggle_twilight = function()
			if twilight_enabled then
				vim.cmd("TwilightDisable")
			else
				vim.cmd("TwilightEnable")
			end
			twilight_enabled = not twilight_enabled
		end

		vim.api.nvim_set_keymap("n", "<leader>li", ":lua _G.toggle_twilight()<CR>", { noremap = true, silent = true })
	end,
}
