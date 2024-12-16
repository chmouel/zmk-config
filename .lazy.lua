return {
	{
		"codethread/qmk.nvim",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>h",
				'<cmd>TermExec dir=%:p:h:h cmd="./build.sh"<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = "*.keymap",
				callback = function()
					require("qmk").format()
				end,
			})
			---@type qmk.UserConfig
			local conf = {
				name = "planck",
				layout = {
					"x x x x x x x x x x x x",
					"x x x x x x x x x x x x",
					"x x x x x x x x x x x x",
					"x x x x x x x x x x x x",
				},
				variant = "zmk",
			}
			require("qmk").setup(conf)
		end,
	},
}
