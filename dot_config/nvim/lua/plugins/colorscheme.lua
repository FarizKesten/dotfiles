return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- or "latte", "frappe", or "macchiato"
      transparent_background = true,
      integrations = {
        nvimtree = true,
        cmp = true,
        telescope = true,
        gitsigns = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
