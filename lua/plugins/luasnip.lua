return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    {
      'rafamadriz/friendly-snippets'
    },
    {
      'saadparwaiz1/cmp_luasnip'
    }
  },
  version = "v2.*", 
  build = "make install_jsregexp",
  config = function()
    --imports
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
