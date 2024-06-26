lvim.leader = "space"
require('twilight').enable()
require("telescope").setup()
require("telescope").load_extension("ui-select")

-- Hop ---------------------------------
-- Hop words
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('v', 'f', function()
  hop.hint_patterns({ current_line_only = true })
end, { remap = true })

-- Hop word on file
vim.keymap.set('', 'f', function()
  hop.hint_words({ current_line_only = false })
end, { remap = true })

-- Hop pattern on line
vim.keymap.set('', 'F', function()
  hop.hint_patterns({ current_line_only = true })
end, { remap = true })

-- Hop pattern on file
vim.keymap.set('', 'T', function()
  hop.hint_patterns({ current_line_only = false })
end, { remap = true })

-- Hop file
vim.keymap.set('', 't', function()
  hop.hint_lines({})
end, { remap = true })

-- Neoclip -------------------------------------------
lvim.builtin.which_key.mappings["v"] = { ":Telescope neoclip<cr>", "Neoclip" }

-- Frecency -------------------------------------------
lvim.builtin.which_key.mappings["o"] = { ":Telescope frecency<cr>", "Frecency" }

-- Trouble ----------------------------------------------
lvim.builtin.which_key.mappings["t"] = { ":Trouble<cr>", "Trouble" }

-- TrevJ ------------------------------------------------
lvim.builtin.which_key.mappings["j"] = { function()
  require('trevj').format_at_cursor()
end, "TrevJ" }

-- Spectre ----------------------------------------------
lvim.builtin.which_key.mappings["r"] = {
  name = "Spectre",
  s = { '<cmd>lua require("spectre").toggle()<cr>', 'Toggle Spectre' },
  w = { '<cmd>lua require("spectre").open_visual({select_word=true})<cr>', 'Search current word' },
  f = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', 'Search on current file' },
}

-- Zen mode ---------------------------------------------
lvim.builtin.which_key.mappings["z"] = { ':ZenMode<cr>', 'Zen mode' }

-- SnipRun ----------------------------------------------
vim.keymap.set('v', 'f', ':SnipRun<cr>', { silent = true })
