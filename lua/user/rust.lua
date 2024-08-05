-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "rust",
  "toml",
}

lvim.builtin.which_key.mappings["R"] = {
  name = "Rust",
  a = { "<cmd>RustLsp codeAction<Cr>", "Code Action" },
  b = { "<cmd>RustLsp openCargo<Cr>", "Open Cargo toml" },
  c = { "<cmd>RustLsp flyCheck run<Cr>", "Check"},
  d = { "<cmd>RustLsp debuggables<Cr>", "Debug"},
  o = { "<cmd>RustLsp openDocs<Cr>", "Open Docs" },
  r = { "<cmd>RustLsp runnables<Cr>", "Run" },
  f = { "<cmd>RustLsp hover actions<Cr>", "Hover actions" },
  e = { "<cmd>RustLsp explainError<Cr>", "Explain error" },
  g = { "<cmd>RustLsp renderDiagnostic<Cr>", "Render diagnosic" },

}

local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    showDisassembly = "never",
  },
}
