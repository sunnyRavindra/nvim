return {
  'akinsho/toggleterm.nvim', version = "*", config = true,
  config = function()
    require("toggleterm").setup{
      size = 20,
      open_mapping = [[<c-\>]],
      direction = 'float',
      auto_scroll = true,
      float_opts = {
        border = 'curved',
        title_pos =  'center' 
      },
    }
  end
}


