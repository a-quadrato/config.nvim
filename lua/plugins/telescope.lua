local map = require("utils.init").map

local function setup()
  require("telescope").setup {
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key",
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
        },
      },
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    },
  }

  -- Find them Files
  map("n", "<leader>f", ":lua require'telescope.builtin'.find_files()<CR>", { silent = true })
  map("n", "<leader>/", ":lua require'telescope.builtin'.live_grep()<CR>", { silent = true })
  map("n", "<leader>g", ":lua require'telescope.builtin'.git_files()<CR>", { silent = true })
  map("n", "<leader>b", ":lua require'telescope.builtin'.buffers()<CR>", { silent = true })
  map("n", "<leader>r", ":lua require'telescope.builtin.__internal'.command_history()<CR>", { silent = true })
end

return {
  setup = setup,
}
