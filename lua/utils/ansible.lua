-- function! s:isAnsible()
--   let filepath = expand("%:p")
--   let filename = expand("%:t")
--   if filepath =~ '\v/(tasks|roles|handlers)/.*\.ya?ml$' | return 1 | en
--   if filepath =~ '\v/(group|host)_vars/' | return 1 | en
--   let s:ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'
--   if exists("g:ansible_ftdetect_filename_regex")
--     let s:ftdetect_filename_regex = g:ansible_ftdetect_filename_regex
--   endif

--   if filename =~ s:ftdetect_filename_regex | return 1 | en

--   let shebang = getline(1)
--   if shebang =~# '^#!.*/bin/env\s\+ansible-playbook\>' | return 1 | en
--   if shebang =~# '^#!.*/bin/ansible-playbook\>' | return 1 | en

--   return 0

-- Determines if a yaml file is Ansible or not
local function isAnsible()
  if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") ~= 0 then
    return true
  end
end

return {
  isAnsible = isAnsible,
}
