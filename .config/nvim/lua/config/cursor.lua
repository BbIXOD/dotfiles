vim.opt.guicursor = table.concat({
  "n:block-blinkwait700-blinkoff400-blinkon250", -- Normal: Blinking block
  "v:block", -- Visual: Solid block
  "i:ver25-blinkwait300-blinkoff200-blinkon150", -- Insert: Blinking vertical bar
  "r:hor20-blinkwait300-blinkoff200-blinkon150", -- Replace: Blinking horizontal bar
  "c:hor20", -- Command: Horizontal bar (no blink)
  "ci:ver25-blinkwait300-blinkoff200-blinkon150", -- Command Insert: Blinking vertical bar
  "cr:hor20-blinkwait300-blinkoff200-blinkon150", -- Command Replace: Blinking horizontal bar
  "o:block", -- Operator-pending: Block cursor
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes get a blink
}, ",")

