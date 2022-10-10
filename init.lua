--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|

local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

local modules = {
  "filetypes",
  "options",
  "plugins",
  "autocmds",
  "mappings",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

--require("mappings").misc()
