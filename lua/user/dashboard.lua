local M = {}

function M.get_sections()
  local buttons = {
    opts = {
      hl_shortcut = "Include",
      spacing = 1,
    },
    entries = {
      { "f", lvim.icons.ui.FindFile .. "  Find File",      "<CMD>Telescope find_files<CR>" },
      { "n", lvim.icons.ui.NewFile .. "  New File",        "<CMD>ene!<CR>" },
      { "p", lvim.icons.ui.Project .. "  Projects ",       "<CMD>Telescope projects<CR>" },

      { "r", lvim.icons.ui.History .. "  Restore Session", ":SessionLoadLast  <CR>" },
      { "t", lvim.icons.ui.FindText .. "  Find Text",      "<CMD>Telescope live_grep<CR>" },
      {
        "c",
        lvim.icons.ui.Gear .. "  Configuration",
        "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
      },
      { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
    },
  }
  return {
    buttons = buttons,
  }
end

return M
