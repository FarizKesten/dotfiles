return {
  -- Jupyter/Molten keybindings
  {
    "benlubas/molten-nvim",
    keys = {
      -- Initialize and manage kernels
      { "<leader>ji", ":MoltenInit<CR>", desc = "Initialize Molten kernel" },
      { "<leader>jd", ":MoltenDeinit<CR>", desc = "Deinitialize Molten" },
      { "<leader>jr", ":MoltenRestart<CR>", desc = "Restart Molten kernel" },

      -- Execute code
      { "<leader>je", ":MoltenEvaluateOperator<CR>", desc = "Evaluate operator selection" },
      { "<leader>jl", ":MoltenEvaluateLine<CR>", desc = "Evaluate current line" },
      { "<leader>jc", ":MoltenReevaluateCell<CR>", desc = "Re-evaluate current cell" },
      { "<leader>je", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Evaluate visual selection" },

      -- Navigate cells
      { "]j", ":MoltenNext<CR>", desc = "Next Molten cell" },
      { "[j", ":MoltenPrev<CR>", desc = "Previous Molten cell" },

      -- Output management
      { "<leader>jo", ":MoltenShowOutput<CR>", desc = "Show output window" },
      { "<leader>jh", ":MoltenHideOutput<CR>", desc = "Hide output window" },
      { "<leader>jx", ":MoltenDelete<CR>", desc = "Delete current cell" },

      -- Image popup
      { "<leader>jp", ":MoltenImagePopup<CR>", desc = "Open image popup" },
    },
  },

  -- Python debugging keybindings
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      {
        "<leader>dm",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug test method",
      },
      {
        "<leader>dc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug test class",
      },
      {
        "<leader>df",
        function()
          require("dap-python").debug_selection()
        end,
        desc = "Debug selection",
        mode = "v",
      },
    },
  },
}
