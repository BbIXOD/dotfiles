local M = {}

function M.toggle_signature()
  local noice = require("noice.lsp.docs")
  local message = noice.get('signature')
  if message then
    noice.hide(message)
  else
    vim.lsp.buf.signature_help()
  end

end

return M
