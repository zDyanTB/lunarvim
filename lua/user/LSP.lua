require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = false,
  -- ensure_installed = {
  --   "bashls",
  --   "marksman",
  --   "clangd",
  --   "cssls",
  --   "jsonls",
  --   "lua_ls"
  -- },
}

-- Do not call the nvim-lspconfig.rust_analyzer setup or set up the LSP client for rust-analyzer manually, as doing so may cause conflicts.
require("lspconfig").lua_ls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").jsonls.setup {}
