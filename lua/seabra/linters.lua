require('lint').linters_by_ft = {
  markdown = {'vale'},
  typescript = {'eslint_d'},
}

-- Some linters require a file to be saved to disk, others support linting stdin input. For such linters you could also define a more aggressive autocmd, for example on the InsertLeave or TextChanged events.
vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
    callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
            lint.try_lint()
        end
    end,
})
