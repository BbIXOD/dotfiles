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

  vim.opt.guicursor = table.concat({
    "n:block-blinkwait1000-blinkoff600-blinkon600", -- Normal: Blinking block
    "v:block", -- Visual: Solid block
    "i:ver25-blinkwait1000-blinkoff500-blinkon500", -- Insert: Vertical bar, slower blink
    "r:hor20-blinkwait1000-blinkoff500-blinkon500", -- Replace: Horizontal bar
    "c:hor20", -- Command: Static horizontal bar
    "ci:ver25-blinkwait1000-blinkoff500-blinkon500", -- Command Insert
    "cr:hor20-blinkwait1000-blinkoff500-blinkon500", -- Command Replace
    "o:block", -- Operator-pending
    "a:blinkwait1000-blinkoff600-blinkon600", -- Global blink settings
  }, ",")
end
