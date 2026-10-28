return {
	spec = {
		{ src = "https://codeberg.org/z4rathustr4/compilation-mode.nvim" },
	},

	config = function()
		require("compilation-mode").setup({})
		-- set keymaps
		vim.keymap.set("n", "<leader>cc", "<cmd>Compile<cr>")
		vim.keymap.set("n", "<leader>cr", "<cmd>Recompile<cr>")
		vim.keymap.set("n", "<A-g>n", "<cmd>CompileNext<cr>")
		vim.keymap.set("n", "<A-g>p", "<cmd>CompilePrev<cr>")
	end,
}
