return {
	spec = {
		{ src = "https://github.com/akinsho/toggleterm.nvim" },
	},

	config = function()
		require("toggleterm").setup({})

		vim.keymap.set("n", "<A-h>", "<cmd>ToggleTerm size=15 direction=horizontal<CR>")
		vim.api.nvim_set_keymap("t", "<A-h>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
