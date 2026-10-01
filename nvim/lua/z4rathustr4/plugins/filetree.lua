return {
	spec = {
		{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
		{ src = "https://github.com/MunifTanjim/nui.nvim" },
	},

	config = function()
		vim.g.neo_tree_remove_legacy_commands = 1

		require("neo-tree").setup({})

		vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
	end,
}
