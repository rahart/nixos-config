if not pcall(require, "telescope") then
  return
end

local actions = require "telescope.actions"

require('telescope').setup()

local mappings = {}
mappings.curr_buf = function ()
  local opt = require("telescope.themes").get_ivy()
  require("telescope.builtin").current_buffer_fuzzy_find(opt)
end

mappings.python = function () require("telescope.builtin").find_files({cwd="/home/hex/py/"}) end
mappings.nvim = function () require("telescope.builtin").find_files({cwd="/home/hex/.config/nvim/"}) end
return mappings
