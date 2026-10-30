return {
	spec = {
		{ src = "https://github.com/wasabeef/bufferin.nvim" },
		-- { src = "nvim-tree/nvim-web-devicons" }, -- depends on this but already defined in another file

	},

	config = function()
		require('bufferin').setup()
	end,

}
