if not pcall(require, "telescope") then
  return
end

local actions = require "telescope.actions"

require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_move = "smart_case",
    }
  }
}

require('telescope').load_extension('fzf')

local mappings = {}
mappings.curr_buf = function ()
  local opt = require("telescope.themes").get_ivy()
  require("telescope.builtin").current_buffer_fuzzy_find(opt)
end

mappings.python = function () require("telescope.builtin").find_files({cwd="/home/hex/py/"}) end
mappings.nvim = function () require("telescope.builtin").find_files({cwd="/home/hex/.config/nvim/"}) end
return mappings
