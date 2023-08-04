return {
  -- make <Tab> confirm the current completion item
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end

      return opts
    end,
  },
}
