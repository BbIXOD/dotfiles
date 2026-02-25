if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun" -- other options: torpedo, pixiedust, sonicboom, ripple, wireframe

  vim.g.neovide_cursor_short_animation_length = 0.3
  vim.g.neovide_cursor_animate_in_insert_mode = true

  vim.g.neovide_cursor_blink = true
  vim.g.neovide_cursor_smooth_blink = true

  vim.opt.columns = 240
  vim.opt.lines = 80

  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_scroll_animation_far_lines = 0
end
