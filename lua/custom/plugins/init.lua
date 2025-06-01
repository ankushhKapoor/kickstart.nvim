-- Custom plugin setup loader
-- This file will be imported in your main `init.lua` using `{ import = 'custom.plugins' }`
-- It should return a table of plugin specs

return {
  require 'custom.plugins.harpoon', -- load harpoon plugin config
  require 'custom.plugins.tmux_navigator', -- load tmux navigator config

  -- You can add more plugins like this:
}
