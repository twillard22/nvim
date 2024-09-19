return {
   "nvimtools/none-ls.nvim",
   dependencies = {
      "nvimtools/none-ls-extras.nvim",
   },
   config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
         on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
               vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
               vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                     vim.lsp.buf.format()
                  end,
               })
            end
         end,
         sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.rubocop,
            require("none-ls.diagnostics.eslint_d"),
            require("none-ls.code_actions.eslint_d"),
         },
      })
   end,
}
