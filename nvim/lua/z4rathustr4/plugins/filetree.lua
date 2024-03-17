-- Unless you are still migrating, remove the deprecated commands from v1.x
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {
      map("n", "<C-n>", "<cmd>Neotree toggle<CR>", opts)
    }
  end,
}
