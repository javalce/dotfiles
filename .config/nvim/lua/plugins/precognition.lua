return {
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    config = function(opts)
      local precognition = require("precognition")
      precognition.setup(opts)

      Snacks.toggle({
        name = "Precognition",
        get = function()
          return not vim.g.precognition_disabled
        end,
        set = function(state)
          local next_state = not state
          if next_state then
            precognition.show()
          else
            precognition.hide()
          end

          vim.g.precognition_disabled = next_state
        end,
      }):map("<leader>uP")
    end,
  },
}
