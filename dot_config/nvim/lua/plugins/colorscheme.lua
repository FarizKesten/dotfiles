return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      integrations = {
        nvimtree = true,
        cmp = true,
        telescope = true,
        gitsigns = true,
      },
    },
  },

  -- Adwaita
  {
    "Mofiqul/adwaita.nvim",
    name = "adwaita",
    priority = 1000,
  },

  -- LazyVim override: pick default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
