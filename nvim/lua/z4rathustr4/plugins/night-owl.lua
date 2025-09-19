return {
	"oxfist/night-owl.nvim",
	config = function()
		require("night-owl").setup({
			bold = true,
			italics = false,
			underline = false,
			undercurl = false,
			transparent_background = false,
		})
		vim.cmd.colorscheme("night-owl")
	end,
}
