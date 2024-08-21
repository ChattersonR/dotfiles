
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    -- ortag = '0.1.8',                             
    dependencies = { 
        'nvim-lua/plenary.nvim' 
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<Leader><Leader>', builtin.find_files, {})
        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
    end
}

