local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node

luasnip.add_snippets("all", {
  s("cl", {
    t("console.log("),
    i(1),
  }),
})
