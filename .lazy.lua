return {
	{
		"codethread/qmk.nvim",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>h",
				"<cmd>TermExec dir="
					.. vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
					.. ' cmd="./%:t:s?.keymap??.sh"<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "*/planck_rev6.keymap",
				callback = function()
					require("qmk").setup({
						name = "planck",
						auto_format_pattern = "*/planck_rev6.keymap",
						layout = {
							"x x x x x x x x x x x x",
							"x x x x x x x x x x x x",
							"x x x x x x x x x x x x",
							"x x x x x x x x x x x x",
						},
						variant = "zmk",
					})
					require("qmk").format()
				end,
			})
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "*/eyelash_corne.keymap",
				callback = function()
					require("qmk").setup({
						name = "eyelash_corne",
						auto_format_pattern = "*/eyelash_corne.keymap",
						layout = {
							"x x x x x x _ _ _ x _ x x x x x x",
							"x x x x x x _ _ x x x x x x x x x",
							"x x x x x x _ x _ x _ x x x x x x",
							"_ _ _ x x x _ _ _ _ _ x x x _ _ _",
						},
						variant = "zmk",
					})
					require("qmk").format()
				end,
			})
		end,
	},
}
