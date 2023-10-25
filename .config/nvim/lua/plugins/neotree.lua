return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- { "<C-n>", "<leader>e", desc = "Explorer NeoTree (root dir)", remap = true },
      {
        "<leader>o",
        function()
          require("neo-tree.command").execute({ toggle = false })
        end,
        desc = "Focus NeoTree (cwd dir)",
      },
    },
  },
}
