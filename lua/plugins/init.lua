local lazy_conf = require "plugins.lazy"
local plugins_conf = require "plugins.plugins"
require("lazy").setup(plugins_conf, lazy_conf)
