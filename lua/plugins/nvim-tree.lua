local map = require("utils.init").map
local function setup()
  -- setup with all defaults
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    sync_root_with_cwd = true,
    view = {
      width = 30,
      -- height = 30,
      side = "left",
      preserve_window_proportions = false,
      number = true,
      relativenumber = false,
      signcolumn = "yes",
    },
    renderer = {
      root_folder_label = false,
      indent_markers = {
        enable = true,
        icons = {
          corner = "└",
          edge = "│",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
      update_root = true,
      ignore_list = {},
    },
    system_open = {
      cmd = "",
      args = {},
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = true,
      custom = {},
      exclude = {},
    },
    git = {
      enable = false,
      ignore = true,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = false,
        global = false,
        restrict_above_cwd = true,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
  }
  map("", "<F5>", ":NvimTreeToggle<CR>")
end

return {
  setup = setup,
}
