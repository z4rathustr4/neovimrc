return {
	spec = {
		{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	},

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = true,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "bold" },
				conditionals = {},
				loops = {},
				functions = { "bold" },
				keywords = {},
				strings = { "bold" },
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "bold" },
				operators = {},
			},
			color_overrides = {
				all = {
					base = "#141414",
					-- crust = "#0F0F0F"
				},
			},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				barbar = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
