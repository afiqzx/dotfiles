
vim.api.nvim_create_user_command(
    'TabSize',
    function(opts)
        -- print(opts.args)
        vim.api.cmd 'set shiftwidth=4'
        vim.api.cmd 'set softtabstop=4'
        vim.api.cmd 'set tabstop=4'

    end,
    { nargs = 1 }
)

