return {
	spec = {
		{ src = "https://github.com/mfussenegger/nvim-dap" },
		{ src = "https://github.com/rcarriga/nvim-dap-ui" },
		{ src = "https://github.com/nvim-neotest/nvim-nio" },
		{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
		{ src = "https://github.com/williamboman/mason.nvim" },
		{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
		{ src = "https://github.com/leoluz/nvim-dap-go" },
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
			},
		})

		require("nvim-dap-virtual-text").setup({})

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end

		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
		local signs = {
			Breakpoint = { text = "●", texthl = "DiagnosticError" },
			BreakpointCondition = { text = "◆", texthl = "DiagnosticWarn" },
			BreakpointRejected = { text = "○", texthl = "DiagnosticError" },
			LogPoint = { text = "◆", texthl = "DiagnosticInfo" },
			Stopped = {
				text = "▶",
				texthl = "DiagnosticInfo",
				linehl = "DapStoppedLine",
				numhl = "DapStoppedLine",
			},
		}
		for name, sign in pairs(signs) do
			vim.fn.sign_define("Dap" .. name, sign)
		end

		require("dap-go").setup()

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<F7>", function()
			dapui.toggle({})
		end, { desc = "Debug: See last session result" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Breakpoint Condition" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
		vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Debug: Run to Cursor" })
		vim.keymap.set("n", "<leader>dg", dap.goto_, { desc = "Debug: Go to line (no execute)" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Debug: Down" })
		vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Debug: Up" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>dO", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Debug: Pause" })
		vim.keymap.set("n", "<leader>dr", function()
			dap.repl.toggle()
		end, { desc = "Debug: Toggle REPL" })
		vim.keymap.set("n", "<leader>ds", dap.session, { desc = "Debug: Session" })
		vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
		vim.keymap.set("n", "<leader>dw", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Debug: Widgets" })
		vim.keymap.set("n", "<leader>du", function()
			dapui.toggle({})
		end, { desc = "Dap UI" })
		vim.keymap.set({ "n", "v" }, "<leader>de", function()
			dapui.eval()
		end, { desc = "Eval" })
	end,
}
