return {
	'catppuccin/nvim', name = 'catppuccin',
	-- Optional dependency
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = true, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "bold" }, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {"bold"},
			keywords = {},
				strings = {"bold"},
				variables = {},
				numbers = {},
			booleans = {},
				properties = {},
				types = {"bold"},
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
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})
		-- setup must be called before loading
		--vim.cmd.colorscheme "catppuccin"
	end,
}
