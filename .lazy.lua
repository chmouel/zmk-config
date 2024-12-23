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
						comment_preview = {
							keymap_overrides = {
								["&trans"] = "__",
								["&sys_reset"] = "🔄",
								["&bootloader"] = "💾",
								["&"] = "",
								mmv = "🖱️",
								MOVE_UP = "↑",
								MOVE_DOWN = "↓",
								MOVE_LEFT = "←",
								MOVE_RIGHT = "→",
								DEBUG_PASTE = "🗒️DEBUG",
								EMAIL = "📧",
								SEMI = ";",
								FSLH = "/",
								BSLH = "\\",
								LBKT = "[",
								RBKT = "]",
								LBRC = "{",
								RBRC = "}",
								SQT = "'",
								EXCL = "!",
								-- PRCNT = "%",
								CARET = "^",
								C_NEXT = "⏭️",
								C_PREV = "⏮️",
								C_PP = "⏯️",
								BT_NXT = "🛜🔼",
								BT_PRV = "🛜🔽",
								BT_CLR = "🛜❌",
								C_MUTE = "🔇",
								C_VOL_DN = "🔉",
								C_VOL_UP = "🔊",
								C_BRI_UP = "🔆",
								C_BRI_DN = "🔅",
								EP_TOG = "🔌",
								AMPS = "&",
								STAR = "*",
								LPAR = "(",
								RPAR = ")",
								MEH = "😒",
								K_UNDO = "↩️",
								["COPY"] = "📄",
								["PASTE"] = "📋",
								["CUT"] = "✂️",
								["LG(Q)"] = "⌘Q",
								["LC(W)"] = "⌃W",
								["LC(T)"] = "⌃T",
								["LC(TAB)"] = "⌃⇥",
								["LS(LC(TAB))"] = "⇧⌃⇥",
								SPACE = "🌌",
								KP_MULTIPLY = "*",
								-- use MENU as compose key
								K_CMENU = "🌍",
								K_MENU = "🌍",
								COMPOSE = "🌍",
								LEFT = "⬅️",
								RIGHT = "➡️",
								SCRL_UP = "⬆️",
								SCRL_DOWN = "⬇️",
								UP = "⬆️",
								DOWN = "⬇️",
								KP_PLUS = "+",
								DQT = '"',
								PG_UP = "⬆️",
								PG_DN = "⬇️",
								HOME = "🏠",
								END = "🔚",
								LC = "^",
								["&FR_A_GRAVE"] = "à",
								["&FR_E_AIGU"] = "é",
								["&FR_E_GRAVE"] = "è",
								["&FR_U_GRAVE"] = "ù",
								["&FR_C_CEDILLE"] = "ç",
								["&FR_A_CIRONFL"] = "â",
								["&FR_E_CIRONFL"] = "ê",
								["&FR_I_CIRONFL"] = "î",
								["&FR_O_CIRONFL"] = "ô",
								["&FR_U_CIRONFL"] = "û",
								["&FR_E_TREMA"] = "ë",
								["&FR_I_TREMA"] = "ï",
								["&FR_3_EURO"] = "€",
								["&FR_OE_LIGATURE"] = "œ",
							},
							symbols = {
								tl = "╭",
								tr = "╮",
								bl = "╰",
								br = "╯",
							},
						},
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
