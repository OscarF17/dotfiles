return {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
          cmd = "lazygit",
          hidden = true,
          direction = "float",
          on_close = function()
            local status_ok, neotree_manager = pcall(require, "neo-tree.sources.manager")
            if status_ok then
              neotree_manager.refresh("filesystem")
            end
          end,
        })

        function _lazygit_toggle()
          lazygit:toggle()
        end
    end
}
