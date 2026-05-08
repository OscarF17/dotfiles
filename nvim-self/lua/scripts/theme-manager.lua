local M = {}
-- Path to the file where we save the theme name
local theme_cache = vim.fn.stdpath("data") .. "/last_theme"

-- Function to save the theme
function M.save_theme()
  local theme = vim.g.colors_name
  local f = io.open(theme_cache, "w")
  if f then
    f:write(theme)
    f:close()
  end
end

-- Function to load the saved theme
function M.load_theme()
  local f = io.open(theme_cache, "r")
  if f then
    local theme = f:read("*all"):gsub("%s+", "")
    f:close()
    -- Wrap in pcall to prevent errors if you delete a theme plugin later
    pcall(vim.cmd.colorscheme, theme)
  else
    -- Fallback theme if no file exists
    vim.cmd.colorscheme("default") 
  end
end

-- Auto-save theme whenever it changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    M.save_theme()
  end,
})

return M
