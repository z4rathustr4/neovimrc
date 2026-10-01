return {
	spec = {
		{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
		{ src = "https://github.com/numToStr/Comment.nvim" },
	},

	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = { "dashboard" },
			},
		})
		require("Comment").setup()
	end,
}
