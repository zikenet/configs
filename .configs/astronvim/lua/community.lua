-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.fuzzy-finder" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  -- import/override with your plugins folder
}
