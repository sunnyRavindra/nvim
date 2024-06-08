return {
  -- {
  --   "marko-cerovac/material.nvim",
  --   config = function()
  --     require('material').setup({
  --       contrast = {
  --         terminal = true,
  --         sidebars = true,
  --         floating_windows = true, 
  --         cursor_line = false, 
  --         lsp_virtual_text = true, 
  --         non_current_windows = true, 
  --       },
  --       styles = {
  --         comments = { italic = true },
  --         strings = { italic = true },
  --         keywords = { italic = true },
  --         functions = { bold = true },
  --         variables = { italic = true },
  --         operators = { italic = true },
  --         types = {},
  --       },
  --       disable = {
  --         colored_cursor = false, 
  --         borders = false, 
  --         background = false, 
  --         term_colors = false, 
  --         eob_lines = false 
  --       },
  --       high_visibility = {}
  --     })
  --     vim.cmd 'colorscheme material'
  --   end
  -- },
  {
    'shaunsingh/nord.nvim',
    config = function()
      require('nord').set()
      vim.cmd[[colorscheme nord]]
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({}) 
    end
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  }
}
