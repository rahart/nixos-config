-- Insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Copilot
vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>")
vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<cr>")
-- vim.api.nvim_set_keymap("i", "<C-A>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
-- Test it in the 

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Normal mode
vim.keymap.set("n", "Y", "yg$") -- yank to end of line
vim.keymap.set("n", "J", "mzJ`z") -- Remove line break downward cursor remains in the same position
vim.keymap.set("n", "<C-u>","<C-u>zz") -- halfpage up cursor in the middle
vim.keymap.set("n", "<C-d>","<C-d>zz") -- halfpage down curor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-s>", ":wa!<cr>") -- save all files in buffers
vim.keymap.set("n", "<leader><leader>s", "<cmd>lua package.loaded.rahart=nil<cr>:source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader><leader>h", "<cmd>lua package.loaded.rahart=nil<cr>:source %<CR>")

vim.keymap.set("x", "<leader>p", "\"_dP")


-- telecscope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true<cr>")
vim.keymap.set("n", "<leader>gr", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>gf", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>gc", ":Telescope git_commits<cr>")
vim.keymap.set("n", "<leader>bf", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>km", ":Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>cb", "<cmd>lua require('rahart.plugins.telescope').curr_buf()<cr>")
vim.keymap.set("n", "<leader>py", "<cmd>lua require('rahart.plugins.telescope').python()<cr>")
vim.keymap.set("n", "<leader>vi", "<cmd>lua require('rahart.plugins.telescope').nvim()<cr>")


-- harpoon
vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>")
vim.keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>")

-- File Tree
vim.keymap.set("n", "<leader>tr", ":NvimTreeToggle<cr>")

-- Luasnip in configfile
-- reload config
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
