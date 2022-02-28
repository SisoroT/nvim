require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.black,
		-- require("null-ls").builtins.formatting.prettier.with({
		-- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		-- }),
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.codespell,
		require("null-ls").builtins.diagnostics.codespell,
		require("null-ls").builtins.diagnostics.flake8,
	},

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
