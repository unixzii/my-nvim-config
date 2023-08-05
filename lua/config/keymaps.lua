-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function bind(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs)
end

bind("i", "jj", "<ESC>")
bind("n", "ga", function()
  vim.lsp.buf.code_action({ apply = true })
end)
bind("n", "W", "<CMD>WhichKey<CR>")
bind("i", "<C-a>", "<ESC>^i")
bind("i", "<C-e>", "<ESC>$a")
bind("n", "<C-a>", "<ESC>^")
bind("n", "<C-e>", "<ESC>$")

bind("n", "<Leader>h", "<CMD>HopWord<CR>")
