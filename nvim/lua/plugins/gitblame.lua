return {
  "f-person/git-blame.nvim",
  name = "git-blame",
  config = function()
    vim.cmd [[let gitblame_date_format = '%r']]
    -- Disabled by default
    vim.cmd [[GitBlameDisable]]
  end,
}
