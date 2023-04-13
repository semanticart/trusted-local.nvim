return {
    setup = function()
        local au_group = vim.api.nvim_create_augroup("Trusted-local lua",
                                                     {clear = true})

        vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
            desc = "Trusted-local for lua",
            pattern = "*",
            callback = function()
                local trusted_local = vim.fn.getcwd() ..
                                          "/.git/safe/../../.init.local.lua"
                if vim.fn.filereadable(trusted_local) == 1 then
                    vim.cmd("luafile " .. trusted_local)
                end
            end,
            group = au_group
        })
    end
}
