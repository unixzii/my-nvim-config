-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.o.scrolloff = 10

vim.o.spell = true
vim.o.spelllang = "en_us"

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h13"
  vim.opt.linespace = 2
  vim.g.neovide_confirm_quit = true

  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.97
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 30.0
end
