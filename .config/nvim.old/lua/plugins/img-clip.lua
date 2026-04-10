return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		drag_and_drop = {
			enables = true,
			copy_images = true,
			insert_mode = true,
		},
	},
	keys = {
		{ "<leader>ci", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
