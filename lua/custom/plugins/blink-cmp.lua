return {
  'saghen/blink.cmp',
  lazy = false, -- or true if you want it to load on command
  opts = {
    completion = {
      list = {
        selection = { preselect = true, auto_insert = true },
      },
    },
    sources = {
      providers = {
        cmdline = {
          enabled = function()
            -- disable for :! shell commands
            return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match "^[%%0-9,'<>%-]*!"
          end,
        },
      },
    },
  },
}
