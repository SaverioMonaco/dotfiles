-- n, v, i, t = mode names

local M = {}

M.window = {
  n = {
    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    -- resize windows
    ["<C-Left>"]  = { "<cmd>vertical resize -2<CR>", "Decrease width" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<CR>", "Increase width" },
    ["<C-Up>"]    = { "<cmd>resize +2<CR>", "Increase height" },
    ["<C-Down>"]  = { "<cmd>resize -2<CR>", "Decrease height" },

    -- switch tabs
    ["<tab>"]    = { "gt", "Next tab" },
    ["<S-tab>"]  = { "gT", "Previous tab" },
  }
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle sidebar" },
  }
}

M.telescope = {
  n = {
    -- Find files
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<leader>fa"] = { "<cmd>Telescope live_grep<CR>", "Find all" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Help page" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },

    -- Git actions
    ["<leader>cm"] = { "<cmd>Telescope git_commits<CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd>Telescope git_status<CR>", "Git status" },

    -- Goto
    ["<leader>gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Go to Definition" },
    ["<leader>gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Go to Implementation" },
  }
}

return M
