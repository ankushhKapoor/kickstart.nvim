return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
  config = function()
    vim.g.tmux_navigator_no_mappings = 1

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', opts)
  end,
}
