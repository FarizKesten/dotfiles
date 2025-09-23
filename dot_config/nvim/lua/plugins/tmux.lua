return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavidateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Pane ←" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Pane ↓" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Pane ↑" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Pane →" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Pane ↺" },
    },
    -- lazy = false,
    -- config = function()
    --   vim.g.tmux_navigator_save_on_switch = 2
    --   vim.g.tmux_navigator_disable_when_zoomed = 1
    --   vim.g.tmux_navigator_no_mappings = 1 -- only if you set keys manually
    --
    --   vim.keymap.del("n", "<C-h>")
    --   vim.keymap.del("n", "<C-j>")
    --   vim.keymap.del("n", "<C-k>")
    --   vim.keymap.del("n", "<C-l>")
    --
    --   vim.keymap.set("n", "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", { desc = "Pane ←" })
    --   vim.keymap.set("n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>", { desc = "Pane ↓" })
    --   vim.keymap.set("n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>", { desc = "Pane ↑" })
    --   vim.keymap.set("n", "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", { desc = "Pane →" })
    --   vim.keymap.set("n", "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>", { desc = "Pane ↺" })
    -- end,
  },
}
