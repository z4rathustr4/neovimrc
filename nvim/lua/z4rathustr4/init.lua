vim.g.mapleader = " "

require("z4rathustr4.options")
require("z4rathustr4.pack")
require("z4rathustr4.keymaps")
require("z4rathustr4.autocmds")

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
