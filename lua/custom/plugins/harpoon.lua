-- Harpoon v2 setup with Lazy.nvim (for kickstart.nvim)
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2', -- use Harpoon v2 branch
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup() -- initialize Harpoon

      -- Keymapping function shortcut
      local map = vim.keymap.set

      -- Add current file to Harpoon (leader + ha)
      map('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Add file to Harpoon' })

      -- Remove current file from Harpoon (leader + hr)
      map('n', '<leader>hr', function()
        harpoon:list():remove()
      end, { desc = 'Remove current buffer from Harpoon' })

      -- Telescope integration: custom picker to show Harpoon files
      local pickers = require 'telescope.pickers'
      local finders = require 'telescope.finders'
      local conf = require('telescope.config').values
      -- Function to toggle a Telescope picker listing Harpoon marks
      local function harpoon_telescope_picker(harpoon_list)
        local file_paths = {}
        for _, item in ipairs(harpoon_list.items) do
          table.insert(file_paths, item.value)
        end
        pickers
          .new({}, {
            prompt_title = 'Harpoon Files',
            finder = finders.new_table { results = file_paths },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end
      -- Map Ctrl+e to open the Telescope-powered Harpoon UI
      map('n', '<C-u>', function()
        harpoon_telescope_picker(harpoon:list())
      end, { desc = 'Open Harpoon list in Telescope' })

      -- Navigate directly to Harpoon files 1 through 5
      map('n', '<leader>h1', function()
        harpoon:list():select(1)
      end, { desc = 'Go to Harpoon file #1' })
      map('n', '<leader>h2', function()
        harpoon:list():select(2)
      end, { desc = 'Go to Harpoon file #2' })
      map('n', '<leader>h3', function()
        harpoon:list():select(3)
      end, { desc = 'Go to Harpoon file #3' })
      map('n', '<leader>h4', function()
        harpoon:list():select(4)
      end, { desc = 'Go to Harpoon file #4' })
      map('n', '<leader>h5', function()
        harpoon:list():select(5)
      end, { desc = 'Go to Harpoon file #5' })

      -- Toggle previous/next Harpoon items (Ctrl+Shift+P/N)
      map('n', '<C-p>', function()
        harpoon:list():prev()
      end, { desc = 'Previous Harpoon file' })
      map('n', '<C-n>', function()
        harpoon:list():next()
      end, { desc = 'Next Harpoon file' })
    end,
  },
}
