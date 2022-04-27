return {
	settings = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "css", "blade", "php", "typescriptreact", "javascriptreact" },
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			-- settings = {},
		},
	},
}
