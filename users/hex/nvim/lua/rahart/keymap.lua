local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
local keymap = vim.keymap.set

-- Insert mode
M.inoremap("<C-c>", "<Esc>")

-- Normal mode
M.nnoremap("<C-i>", ":PackerInstall<cr>")
M.nnoremap("<A-s>", ":w!<cr>")
M.nnoremap("<C-u>","<C-u>zz")
M.nnoremap("<C-d>","<C-d>zz")

-- telecscope
M.nnoremap("<leader>ff", ":Telescope find_files<cr>")
M.nnoremap("<leader>lg", ":Telescope live_grep<cr>")
M.nnoremap("<leader>gf", ":Telescope git_files<cr>")
M.nnoremap("<leader>gc", ":Telescope git_commits<cr>")


-- harpoon
M.nnoremap("<leader>hm", ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
M.nnoremap("<leader>ha", ":lua require(\"harpoon.mark\").add_file()<cr>")

-- Tree
M.nnoremap("<leader>t", ":NvimTreeToggle<cr>")
