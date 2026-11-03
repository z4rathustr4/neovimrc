return {
	spec = {
		{ src = "https://github.com/NeogitOrg/neogit.git" },
		{ src = "https://github.com/sindrets/diffview.nvim.git" }, -- optional
		{ src = "https://github.com/m00qek/baleia.nvim.git" },   -- optional

	},
	config = function()
		vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
	end
}
