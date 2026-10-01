return {
	spec = {
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/williamboman/mason.nvim" },
		{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
		{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
		{ src = "https://github.com/hrsh7th/cmp-buffer" },
		{ src = "https://github.com/hrsh7th/cmp-path" },
		{ src = "https://github.com/hrsh7th/cmp-cmdline" },
		{ src = "https://github.com/hrsh7th/nvim-cmp" },
		{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
		{ src = "https://github.com/j-hui/fidget.nvim" },
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"pylsp",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				["pylsp"] = function()
					require("lspconfig").pylsp.setup({
						capabilities = capabilities,
						settings = {
							pylsp = {
								plugins = {
									black = { enabled = true },
									autopep8 = { enabled = false },
									yapf = { enabled = false },
									pylint = { enabled = false, executable = "pylint" },
									pyflakes = { enabled = false },
									pycodestyle = { enabled = false },
									pylsp_mypy = { enabled = true },
									jedi_completion = { fuzzy = true },
									pyls_isort = { enabled = true },
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<TAB>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			virtual_text = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
