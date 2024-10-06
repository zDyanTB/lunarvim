lvim.leader = "space"
require('twilight').enable()
require("telescope").setup()
require("telescope").load_extension("ui-select")

-- Hop ---------------------------------
-- Hop words
local hop = require('hop')
local directions = require('hop.hint').HintDirection

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

-- Multicursor --------------------------------------------
local mc = require("multicursor-nvim")
mc.setup()

-- Add cursors above/below the main cursor.
vim.keymap.set({ "n", "v" }, "<up>", function() mc.addCursor("k") end)
vim.keymap.set({ "n", "v" }, "<down>", function() mc.addCursor("j") end)

-- Add a cursor and jump to the next word under cursor.
vim.keymap.set({ "n", "v" }, "<c-n>", function() mc.addCursor("*") end)

-- Jump to the next word under cursor but do not add a cursor.
vim.keymap.set({ "n", "v" }, "<c-j>", function() mc.skipCursor("*") end)

-- Rotate the main cursor.
vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

-- Delete the main cursor.
vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

vim.keymap.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    -- Stop other cursors from moving.
    -- This allows you to reposition the main cursor.
    mc.disableCursors()
  else
    mc.addCursor()
  end
end)

vim.keymap.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler.
  end
end)

-- Align cursor columns.
vim.keymap.set("n", "<leader>a", mc.alignCursors)

-- Split visual selections by regex.
vim.keymap.set("v", "S", mc.splitCursors)

-- Append/insert for each line of visual selections.
vim.keymap.set("v", "I", mc.insertVisual)
vim.keymap.set("v", "A", mc.appendVisual)

-- match new cursors within visual selections by regex.
vim.keymap.set("v", "M", mc.matchCursors)

-- Rotate visual selection contents.
vim.keymap.set("v", "<leader>t", function() mc.transposeCursors(1) end)
vim.keymap.set("v", "<leader>T", function() mc.transposeCursors(-1) end)

-- Customize how cursors look.
vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })

-- Menu-ui ----------------------------------------------------------------
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
