local luasnip = require("luasnip")

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

local consoleSnippet = s("cl", {
  t("console.log("),
  i(0), -- Cursor will be here after expansion
  t(")"),
})
for _, ft in ipairs({ "javascript", "typescript", "typescriptreact" }) do
  luasnip.add_snippets(ft, { consoleSnippet })
end
