local vim = vim  -- just for clarity

-- Always load shared mappings
local mappings = require("custom.mappings")

-- Conditionally load and merge environment-specific mappings
local env_mappings = vim.g.vscode
  and require("custom.vscode.mappings")
  or require("custom.nvim.mappings")

-- Debugging: check what is being loaded
-- print("Loading environment mappings: ", vim.inspect(env_mappings))
-- print("Base mappings: ", vim.inspect(mappings))

-- Merge env_mappings into mappings (shallow merge)
for section_name, section_mappings in pairs(env_mappings) do
  if type(section_mappings) == "table" then
    mappings[section_name] = vim.tbl_extend("force", mappings[section_name] or {}, section_mappings)
  end
end

-- Debugging: check mappings after merging
-- print("Mappings after merge: ", vim.inspect(mappings))

-- Valid modes
local valid_modes = {
  n = true, i = true, v = true, x = true,
  t = true, o = true, c = true, s = true,
}

-- Apply keymaps
local function set_mappings(mode, mappings)
  for lhs, mapping in pairs(mappings) do
    local rhs = mapping[1]
    local opts = { desc = mapping[2] or "", silent = true, noremap = true}
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Loop and apply
for _, section_mappings in pairs(mappings) do
  if type(section_mappings) == "table" then
    for mode, mode_mappings in pairs(section_mappings) do
      if valid_modes[mode] and type(mode_mappings) == "table" then
        -- Debugging: print section name and mode mappings
        -- print("Setting mappings for mode:", mode)
        -- print(vim.inspect(mode_mappings))
        set_mappings(mode, mode_mappings)
      end
    end
  end
end
