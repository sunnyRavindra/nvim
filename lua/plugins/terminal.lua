return {
  'akinsho/toggleterm.nvim', version = "*", config = true,
  config = function()
    require("toggleterm").setup{
      autochdir = false,
      size = 20,
      direction = 'float',
      auto_scroll = true,
      open_mapping = [[<c-\>]],
      float_opts = {
        border = 'curved',
        title_pos =  'center'
      },
    }
  end
}


