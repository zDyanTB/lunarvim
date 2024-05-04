require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = false,
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "bashls",
    "marksman",
    "clangd",
    "cssls",
    "jsonls",
    "lua_ls"
  },
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").jsonls.setup {}
