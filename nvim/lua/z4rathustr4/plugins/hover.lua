return {
	spec = {
		{ src = "https://github.com/lewis6991/hover.nvim" },
	},

	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.lsp")
				-- require('hover.providers.gh')
				-- require('hover.providers.gh_user')
				-- require('hover.providers.jira')
				-- require('hover.providers.man')
				-- require('hover.providers.dictionary')
			end,
			preview_opts = {
				border = nil,
			},
			preview_window = false,
			title = true,
		})

		vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
		vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
	end,
}
