return {
	spec = {
		{
			src = "https://github.com/rose-pine/neovim",
			name = "rose-pine",
		},
	},

	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = false,
				transparency = false,
			},

		})

		vim.cmd("colorscheme rose-pine")
		-- vim.cmd("colorscheme rose-pine-main")
		-- vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme rose-pine-dawn")
	end,
}
