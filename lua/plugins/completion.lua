return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), 
        }),
        sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' }, },
          {
            { name = 'buffer' },
          })
      })
    end
  },
  { 
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local bicep_lsp_bin = "~/code/lsp/bicep-langserver/Bicep.LangServer.dll"
      vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.bicep.setup{
        cmd = { "dotnet", bicep_lsp_bin },
        capabilities = capabilities,
      }
    end,
  },
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'saadparwaiz1/cmp_luasnip'},
  {'rafamadriz/friendly-snippets'},
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*", 
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      all = {
        s("sample", { t{"line one", "line two", "line three"} }),
      }

      lua = {
        s("trigger", {
          t({"After expanding, the cursor is here ->"}), i(1),
          t({"", "After jumping forward once, cursor is here ->"}), i(2),
          t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
        })    }

      -- Keymaps
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})

      -- Snippets
      ls.add_snippets("all", all)
      ls.add_snippets("lua", lua)
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

    end
  }
}
