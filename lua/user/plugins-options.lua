lvim.leader = "space"
require('twilight').enable()

-- Hop ---------------------------------
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_patterns({ current_line_only = true })
end, { remap = true })

vim.keymap.set('', 'F', function()
  hop.hint_patterns({ current_line_only = false })
end, { remap = true })

vim.keymap.set('', 't', function()
  hop.hint_lines({})
end, { remap = true })

vim.keymap.set('', 'T', function()
  hop.hint_anywhere({})
end, { remap = true })

-- p -------------------------------------------
lvim.builtin.which_key.mappings["v"] = { ":Telescope neoclip<cr>", "Neoclip" }

-- Frecency -------------------------------------------
lvim.builtin.which_key.mappings["o"] = { ":Telescope frecency<cr>", "Frecency" }
