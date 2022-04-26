local g = vim.g

local function setup()
  -- Use a fancy single border for the register preview
  g.register_window_border = "single"
end
return {
  setup = setup,
}
