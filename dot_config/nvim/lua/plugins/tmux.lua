-- ~/.config/nvim/lua/tmux.lua
return {
  -- existing plugins…
  {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- load immediately
    config = function()
      -- Remap keys in Neovim for seamless navigation
      vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Pane ←" })
      vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Pane ↓" })
      vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Pane ↑" })
      vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Pane →" })
      vim.keymap.set("n", "<C-\\>", "<Cmd>TmuxNavigatePrevious<CR>", { desc = "Pane ↺" })

      -- Optional: auto-save buffers on switch
      vim.g.tmux_navigator_save_on_switch = 2

      -- Optional: disable when a pane is zoomed
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end,
  },
}
