local M = {}

M.general = {
  n = {
    -- Leave Ctrl-A unbounded for tmux
    ["<C-S-x>"] = { "<C-a>", "Increment number" },  -- remap Ctrl-X to increment
    ["<C-a>"] = { "<Nop>", "Unbound" },          -- unbind Ctrl-A
  },
}

M.motion = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },

  n = {
    ["H"] = {"^", "Beginning of line"},
    ["L"] = {"<End>", "End of line"},
    ["J"] = {"5j", "5 lines below"},
    ["K"] = {"5k", "5 lines above"},

    ["<CR>"] = { "o<Esc>", "New line below (stay in normal mode)" },
  },

  v = {
    ["H"] = {"^", "Beginning of line"},
    ["L"] = {"<End>", "End of line"},
    ["J"] = {"5j", "5 lines below"},
    ["K"] = {"5k", "5 lines above"},
  },

  x = {
    ["H"] = {"^", "Beginning of line"},
    ["L"] = {"<End>", "End of line"},
    ["J"] = {"5j", "5 lines below"},
    ["K"] = {"5k", "5 lines above"},
  },
  
  o = {
    ["H"] = {"^", "Beginning of line"},
    ["L"] = {"<End>", "End of line"},
    ["J"] = {"5j", "5 lines below"},
    ["K"] = {"5k", "5 lines above"},
  },
}

M.file = {
  n = {
    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M
