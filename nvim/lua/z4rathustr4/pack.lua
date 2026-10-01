-- [[ pack.lua ]]

---@type table<string, {spec: vim.pack.Spec[], config: (fun())?}>
local modules = {
	require("z4rathustr4.plugins.lsp"),
	require("z4rathustr4.plugins.autoformat"),
	require("z4rathustr4.plugins.luasnip"),
	require("z4rathustr4.plugins.autopairs"),
	require("z4rathustr4.plugins.filetree"),
	require("z4rathustr4.plugins.telescope"),
	require("z4rathustr4.plugins.toggleterm"),
	require("z4rathustr4.plugins.dap"),
	require("z4rathustr4.plugins.hover"),
	require("z4rathustr4.plugins.catppuccin"),
	require("z4rathustr4.plugins.dashboard"),
	require("z4rathustr4.plugins.misc"),
}

-- single confirmation prompt on plugin install
local specs = {}
for _, mod in ipairs(modules) do
	for _, spec in ipairs(mod.spec or {}) do
		specs[#specs + 1] = spec
	end
end

vim.pack.add(specs)

-- install plugins
for _, mod in ipairs(modules) do
	if mod.config then
		mod.config()
	end
end
