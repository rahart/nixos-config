if not pcall(require, "telescope") then
  return
end

local actions = require "telescope.actions"

require('telescope').setup()
