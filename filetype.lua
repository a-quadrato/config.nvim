vim.filetype.add {
  yaml = function(path, bufnr)
    require("utils.ansible").isAnsible(path, bufnr)
  end,
  filename = {
    ["hosts"] = "ansible_hosts",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}
