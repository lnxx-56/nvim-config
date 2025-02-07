local M = {}

function M.pick_colorscheme()
  local themes = vim.fn.getcompletion("", "color") -- Get available colorschemes

  if #themes == 0 then
    vim.notify("No colorschemes found!", vim.log.levels.WARN)
    return
  end

  vim.ui.select(themes, { prompt = "Select colorscheme:" }, function(choice)
    if choice then
      vim.cmd("colorscheme " .. choice)
    end
  end)
end

vim.api.nvim_create_user_command("PickColorscheme", M.pick_colorscheme, {})

return M

