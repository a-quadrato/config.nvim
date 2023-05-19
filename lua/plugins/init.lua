local lazy_conf = require "lua.plugins.lazy"
local plugins_conf = require "lua.plugins.plugins"
require("lazy").setup(plugins_conf, lazy_conf)
