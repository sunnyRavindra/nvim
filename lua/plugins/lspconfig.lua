return {
	"neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").bicep.setup{
      cmd = { "dotnet", "bicep", "lsp" },
      filetypes = { "bicep" },
      root_dir = require("lspconfig.util").root_pattern("bicepconfig.json"),
    }
  end
}
