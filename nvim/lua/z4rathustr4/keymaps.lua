-- [[ keymaps.lua ]]

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>w", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

-- show quickfix list from diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)

-- jump through diagnostics with C-k and C-j
vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.jump({ count = 1, float = true })
	vim.cmd("normal! zz")
end)
vim.keymap.set("n", "<C-k>", function()
	vim.diagnostic.jump({ count = -1, float = true })
	vim.cmd("normal! zz")
end)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- old bullcrap
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- new rename bullcrap:
vim.keymap.set("n", "<leader>s", function()
	local word = vim.fn.expand("<cword>")
	if word == "" then return end

	vim.ui.input({ prompt = "Rename " .. word .. ": ", default = word }, function(new)
		if not new or new == "" or new == word then return end

		local pat = vim.fn.escape(word, [[/\.*$^~[]])
		local rep = vim.fn.escape(new, [[/\&~]])
		vim.cmd(("%%s/\\<%s\\>/%s/gI"):format(pat, rep))
	end)
end, { desc = "Rename word under cursor in buffer" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "]f", function()
	vim.diagnostic.jump({ count = 1 })
end)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end)

--[[
-- bufferin.nvim
--]]
vim.keymap.set('n', '<A-e>', '<C-e>', { desc = 'Scroll down, keep cursor line' })
vim.keymap.set('n', '<C-e>', '<cmd>Bufferin<cr>', { desc = 'Bufferin', silent = true })


-- insert go if err != nil
vim.keymap.set(
	"n",
	"<leader>ee",
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- Go / Rust build & run
vim.keymap.set("n", "<leader>gb", "<cmd>!go build .<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>!go run .<CR>")
vim.keymap.set("n", "<leader>mm", "<cmd>!cargo build<CR>")
