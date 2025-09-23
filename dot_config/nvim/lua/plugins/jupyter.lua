return {
  -- Core Jupyter functionality
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- Set up Python path for Jupyter kernel
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
  },

  -- Enhanced Python notebook workflow
  {
    "jeryldev/pyworks.nvim",
    dependencies = {
      "benlubas/molten-nvim",
      "GCBallesteros/jupytext.nvim",
    },
    opts = {
      python_path = "python3",
      auto_activate = true,
    },
  },

  -- Jupyter notebook file support
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup({
        style = "markdown",
        output_extension = "md",
        force_ft = "markdown",
      })
    end,
  },

  -- Image rendering support
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock
    dependencies = {
      {
        "kiyoon/magick.nvim",
        build = function()
          -- Install magick LuaRock
          local handle = io.popen("luarocks --local --lua-version=5.1 install magick")
          if handle then
            local result = handle:read("*a")
            handle:close()
            print("Magick installation result: " .. result)
          end
        end,
      },
    },
    opts = {
      processor = "magick_cli",
      backend = "kitty", -- or "ueberzug"
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
    },
    init = function()
      -- Add magick to Lua path for image.nvim
      package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
      package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
    end,
  },
}
