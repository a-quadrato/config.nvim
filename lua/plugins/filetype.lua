local function setup()
  -- In init.lua or filetype.nvim's config file
  require("filetype").setup {
    overrides = {
      extensions = {
        -- Set the filetype of *.pn files to potion
        pn = "potion",
      },
      literal = {
        -- Set the filetype of files named "MyBackupFile" to lua
        MyBackupFile = "lua",
      },
      complex = {
        -- Set the filetype of any full filename matching the regex to gitconfig
        ["ansible/.*.ya?ml"] = "ansible",
        ["tasks/.*.ya?ml"] = "ansible",
        ["roles/.*.ya?ml"] = "ansible",
        ["handlers/.*.ya?ml"] = "ansible",
        ["inventory/.*.ya?ml"] = "ansible",
      },
      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = "sh",
      },
    },
  }
end

return {
  setup = setup,
}
