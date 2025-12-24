-- n, v, i, t = mode names

local M = {}

M.window = {
  n = {
    -- switch between windows
    ["<C-h>"] = { function() require('vscode').action('workbench.action.navigateLeft') end, "Window left" },
    ["<C-l>"] = { function() require('vscode').action('workbench.action.navigateRight') end, "Window right" },
    ["<C-j>"] = { function() require('vscode').action('workbench.action.navigateDown') end, "Window down" },
    ["<C-k>"] = { function() require('vscode').action('workbench.action.navigateUp') end, "Window up" },

    ["<C-Left>"] = { function() require('vscode').action('workbench.action.decreaseViewWidth') end, "Decrease width" },
    ["<C-Right>"] = { function() require('vscode').action('workbench.action.increaseViewWidth') end, "Increase width" },
    ["<C-Up>"] = { function() require('vscode').action('workbench.action.increaseViewHeight') end, "Increase height" },
    ["<C-Down>"] = { function() require('vscode').action('workbench.action.decreaseViewHeight') end, "Decrease height" },

   -- Switch between tabs
    ["<tab>"] = { function() require('vscode').action('workbench.action.nextEditor') end, "Next tab" },
    ["<S-tab>"] = { function() require('vscode').action('workbench.action.previousEditor') end, "Previous tab" },
  }
}

M.nvimtree = {
  n = { -- toggle ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" }, -- focus
    ["<leader>e"] = { function() require('vscode').action('workbench.action.toggleSidebarVisibility') end, "Toggle sidebar" },
  },
}

M.telescope = {
  n = {
   -- Find files and similar actions in VS Code
    ["<leader>ff"] = { function() require('vscode').action('workbench.action.quickOpen') end, "Find files" },
    ["<leader>fa"] = { function() require('vscode').action('periscope.search') end, "Find all" },
    ["<leader>fh"] = { function() require('vscode').action('workbench.action.openDocumentationUrl') end, "Help page" },
    ["<leader>fo"] = { function() require('vscode').action('workbench.action.openRecent') end, "Find oldfiles" },
    ["<leader>fz"] = { function() require('vscode').action('workbench.action.showAllSymbols') end, "Find in current buffer" },

    -- Git actions
    ["<leader>cm"] = { function() require('vscode').action('workbench.view.scm') end, "Git commits" },
    ["<leader>gt"] = { function() require('vscode').action('git.showQuickDiff') end, "Git status" },

  -- Goto
    ["<leader>gd"] = { function() require('vscode').action('editor.action.revealDefinition') end, "Go to Definition" },
    ["<leader>gi"] = { function() require('vscode').action('editor.action.goToImplementation') end, "Go to Implementation" },
  },
}

return M
