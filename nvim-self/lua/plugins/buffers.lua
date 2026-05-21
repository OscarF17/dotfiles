-- Plugins related to buffers
return {
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
  },
  {
    -- Add tabs at the top of window for currently open buffer
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- show buffers, not tabs
          -- This ensures the close button on the tab itself uses bufdelete
          close_command = "Bdelete! %d",
          right_mouse_command = "Bdelete! %d",
          separator_style = "slant", -- options: "slant" | "thick" | "thin"
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            }
          },
        }
      })
    end,
  }
}
