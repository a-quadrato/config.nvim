-- More info can be found with  `:h lua-filetype`

local function is_ansible(filepath, bufnr)
  if string.match(filepath, "/(tasks|roles|handlers)/.*%.ya?ml$") then
    return true
  end
  if string.match(filepath, "/(group/host)_vars") then
    return true
  end
  -- TODO: Implement a global custom option that matches ansible filetypes....
  -- let s:ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'
  -- if exists("g:ansible_ftdetect_filename_regex")
  --   let s:ftdetect_filename_regex = g:ansible_ftdetect_filename_regex
  -- endif

  -- if filename =~ s:ftdetect_filename_regex | return 1 | en

  local shebang = vim.filetype.getlines(bufnr, 1)
  if
    vim.filetype.matchregex(shebang, [[^#!.*/bin/env\s\+ansible-playbook\>]])
    or vim.filetype.matchregex(shebang, [[^#!.*/bin/ansible-playbook\>]])
  then
    return true
  end
  return false
end

vim.filetype.add {
  extension = {
    yaml = function(path, bufnr)
      if is_ansible(path, bufnr) then
        return "yaml.ansible"
      end
      return "yaml"
    end,
  },
  filename = {
    -- [".foorc"] = "toml",
    -- ["/etc/foo/config"] = "toml",
  },
  pattern = {

    -- [".*/etc/foo/.*"] = "fooscript",
    -- -- Using an optional priority
    -- [".*/etc/foo/.*%.conf"] = { "dosini", { priority = 10 } },
    -- -- A pattern containing an environment variable
    -- ["${XDG_CONFIG_HOME}/foo/git"] = "git",
    -- ["README.(a+)$"] = function(path, bufnr, ext)
    --   if ext == "md" then
    --     return "markdown"
    --   elseif ext == "rst" then
    --     return "rst"
    --   end
    -- end,
  },
}
